*My Favorite*

# Installation Guide: Nemo Contains And Scroll

*This nemo_action:* 
>opens the containing directory of a selected item in a new window and attempts to scroll to and highlight the item, enhancing the file navigation experience within the Nemo file manager.

## Enabled Features
- **Seamless Navigation**: Opens the containing folder of any selected file or folder in a new Nemo window, automatically scrolling to and highlighting the item.
- **User-Friendly**: Integrates smoothly into the Nemo context menu for easy access with a right-click.
- **Efficiency Boost**: Especially useful during searches, saving time and clicks by directly showing the item's location in its directory.

## Quick Start
### SingleCommand Install

To install the Nemo action **on Linux Mint**, open a terminal and execute this **SingleCommand**:

```
REPO_URL="https://github.com/ForDefault/nemo_contains_and_scroll.git" && \
REPO_NAME=$(basename $REPO_URL .git) && \
git clone $REPO_URL && \
cd $REPO_NAME && \
sudo apt-get update && sudo apt-get install -y xdotool && \
sed -i "s|/home/\$USER|/home/$USER|g" contains_and_scroll.nemo_action && \
mv contains_and_scroll.sh /home/$USER/.local/share/nemo/actions/ && \
mv contains_and_scroll.nemo_action /home/$USER/.local/share/nemo/actions/ && \
chmod +x /home/$USER/.local/share/nemo/actions/contains_and_scroll.sh && \
chmod +x /home/$USER/.local/share/nemo/actions/contains_and_scroll.nemo_action && \
cd .. && rm -rf $REPO_NAME
```

## Usage

Right-click on any file or folder within Nemo, and select "Contains And Scroll" from the context menu. You will be taken to the containing directory in a new window, scrolled to that item, and it will be highlighted.

#### My Other Nemo Actions:
- [nemo_copy_folder_content_list](https://github.com/ForDefault/nemo_copy_folder_content_list)
- [nemo_full_extension_path](https://github.com/ForDefault/nemo_full_extension_path)
- **[nemo_contains_and_scroll](https://github.com/ForDefault/nemo_contains_and_scroll)**

## Post-Installation

To ensure the changes take effect, you may need to restart Nemo with the following command:

```
 nemo -q
```

## Troubleshooting

If the action does not appear in Nemo's context menu or doesn't function as expected, please check the following:

- Ensure `xdotool` is installed and operational.
```
sudo apt install xdotool
```

- Verify that the action script has the correct permissions and is located at 
```
cd /home/$USER/.local/share/nemo/actions/
```
- Restart Nemo using to apply the changes.

```
nemo -q
```
