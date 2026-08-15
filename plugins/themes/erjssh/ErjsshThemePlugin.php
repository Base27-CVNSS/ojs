<?php

/**
 * @file plugins/themes/erjssh/ErjsshThemePlugin.php
 *
 * ERJSSH child theme for Open Journal Systems 3.6.
 * Distributed under the GNU GPL v3 or later.
 */

namespace APP\plugins\themes\erjssh;

use PKP\plugins\ThemePlugin;

class ErjsshThemePlugin extends ThemePlugin
{
    public function init(): void
    {
        $this->setParent('defaultthemeplugin');
        $this->addStyle('erjssh', 'styles/index.css');
        $this->addScript('erjsshAccess', 'scripts/access.js');
    }

    public function getDisplayName(): string
    {
        return __('plugins.themes.erjssh.name');
    }

    public function getDescription(): string
    {
        return __('plugins.themes.erjssh.description');
    }

    public function getContextSpecificPluginSettingsFile(): string
    {
        return $this->getPluginPath() . '/settings.xml';
    }

    public function getInstallSitePluginSettingsFile(): string
    {
        return $this->getPluginPath() . '/settings.xml';
    }
}
