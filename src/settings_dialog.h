#ifndef SETTINGS_DIALOG_H
#define SETTINGS_DIALOG_H

#include <QDialog>

#include "config_manager.h"

namespace Ui {
class SettingsDialog;
}

class SettingsDialog : public QDialog
{
    Q_OBJECT

    using ConfigManagerPtr = std::shared_ptr<ConfigManager>;

public:
    explicit SettingsDialog(ConfigManagerPtr configManager, QWidget *parent = nullptr);
    ~SettingsDialog();

private slots:
    void on_clearDataButton_clicked();
    void on_autoRunCheckBox_clicked(bool checked);
    void on_runAsAdminCheckBox_clicked(bool checked);

private:
    Ui::SettingsDialog *ui;
    ConfigManagerPtr m_configManager;
    bool m_autoRun;
    bool m_runAsAdmin;
};

#endif // SETTINGS_DIALOG_H
