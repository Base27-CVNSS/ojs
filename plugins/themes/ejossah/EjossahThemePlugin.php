<?php

/**
 * @file plugins/themes/ejossah/EjossahThemePlugin.php
 *
 * Copyright (c) 2026 Base27-CVNSS contributors
 * Distributed under the GNU GPL v3 or later.
 *
 * @class EjossahThemePlugin
 *
 * @brief EJOSSAH academic child theme for OJS 3.6.
 */

namespace APP\plugins\themes\ejossah;

use PKP\plugins\ThemePlugin;

class EjossahThemePlugin extends ThemePlugin
{
    private const DEFAULT_ACCENT = '#7B1F2D';

    /**
     * Register the parent theme, assets and appearance options.
     */
    public function init(): void
    {
        $this->setParent('defaultthemeplugin');

        $this->addOption('accentColour', 'FieldColor', [
            'label' => __('plugins.themes.ejossah.option.accentColour.label'),
            'description' => __('plugins.themes.ejossah.option.accentColour.description'),
            'default' => self::DEFAULT_ACCENT,
        ]);

        $this->addOption('showEjossahHero', 'FieldOptions', [
            'label' => __('plugins.themes.ejossah.option.showHero.label'),
            'description' => __('plugins.themes.ejossah.option.showHero.description'),
            'options' => [
                [
                    'value' => true,
                    'label' => __('plugins.themes.ejossah.option.showHero.option'),
                ],
            ],
            'default' => true,
        ]);

        $accentColour = $this->normaliseAccentColour($this->getOption('accentColour'));

        $this->addStyle('ejossah', 'styles/index.css');
        $this->addStyle(
            'ejossahVariables',
            ':root{--ej-accent:' . $accentColour . ';}',
            ['inline' => true]
        );

        if (!$this->getOption('showEjossahHero')) {
            $this->addStyle(
                'ejossahHideHero',
                '.ejossah_hero{display:none!important;}',
                ['inline' => true]
            );
        }
    }

    /**
     * Reject invalid CSS colours before saving a theme option.
     */
    public function saveOption($name, $value, $contextId = null): void
    {
        if ($name === 'accentColour') {
            $value = $this->normaliseAccentColour($value);
        }

        parent::saveOption($name, $value, $contextId);
    }

    public function getDisplayName(): string
    {
        return __('plugins.themes.ejossah.name');
    }

    public function getDescription(): string
    {
        return __('plugins.themes.ejossah.description');
    }

    public function getContextSpecificPluginSettingsFile(): string
    {
        return $this->getPluginPath() . '/settings.xml';
    }

    public function getInstallSitePluginSettingsFile(): string
    {
        return $this->getPluginPath() . '/settings.xml';
    }

    private function normaliseAccentColour(mixed $colour): string
    {
        if (!is_string($colour) || !preg_match('/^#[0-9a-fA-F]{6}$/', $colour)) {
            return self::DEFAULT_ACCENT;
        }

        return strtoupper($colour);
    }
}
