#!/usr/bin/env sh

sketchybar --add   space          space_template left                \
           --set   space_template icon.color=0xff76add0              \
                                  label.drawing=off                  \
                                  drawing=off                        \
                                  updates=on                         \
                                  associated_display=1               \
                                  label.font="$FONT:Black:10.0"      \
                                  icon.font="Dotfiles-itaysharir:Regular:15.5"              \
                                  icon.padding_right=13               \
                                  icon.padding_left=13               \
                                  background.padding_left=0          \
                                  background.padding_right=-2         \
                                  icon.background.height=2           \
                                  icon.background.color=$ICON_COLOR  \
                                  icon.background.color=$ICON_COLOR  \
                                  icon.background.y_offset=-13       \
                                  click_script="$SPACE_CLICK_SCRIPT" \
                                  script="$PLUGIN_DIR/space.sh"      \
                                                                     \
           --clone spaces_1.label label_template                     \
                                  associated_display=2               \
                                  label.width=45                     \
                                  label.align=center                 \
                                  position=left                      \
                                  drawing=on                         \
                                                                     \
           --clone spaces_1.idle  space_template                     \
           --set   spaces_1.idle  associated_space=1                 \
                                  icon=                           \
                                  icon.color=0xff94e2d6    \
                                  icon.highlight_color=0xff94e2d6    \
                                  icon.background.color=0xff94e2d6   \
                                  drawing=on                         \
                                  icon.font="Dotfiles-itaysharir:Regular:16.0"              \
                                  background.padding_left=-9                                 \
                                                                     \
           --clone spaces_1.misc  space_template                     \
           --set   spaces_1.misc  associated_space=2                 \
                                  icon=                           \
                                  icon.color=0xfff3c1e6    \
                                  icon.highlight_color=0xfff3c1e6    \
                                  icon.background.color=0xfff3c1e6   \
                                  drawing=on                         \
                                                                     \
           --clone spaces_1.doc   space_template                     \
           --set   spaces_1.doc   associated_space=3                 \
                                  icon=                           \
                                  icon.color=0xff54576c    \
                                  icon.highlight_color=0xff54576c    \
                                  icon.background.color=0xff54576c   \
                                  drawing=on                         \
                                                                     \
           --clone spaces_1.help  space_template                     \
           --set   spaces_1.help  associated_space=4                 \
                                  icon=                           \
                                  icon.color=0xffe0819d    \
                                  icon.highlight_color=0xffe0819d    \
                                  icon.background.color=0xffe0819d   \
                                  drawing=on                         \
                                                                     \
           --clone spaces_1.music space_template                     \
           --set   spaces_1.music associated_space=5                 \
                                  icon=                          \
                                  icon.color=0xff89b4fa    \
                                  icon.highlight_color=0xff89b4fa    \
                                  icon.background.color=0xff89b4fa   \
                                  drawing=on                         \
                                                                     \
           --clone spaces_2.nine  space_template                     \
           --set   spaces_2.nine  associated_space=6                 \
                                  icon=                          \
                                  icon.highlight_color=0xffa6e3a1    \
                                  icon.background.color=0xffa6e3a1   \
                                  icon.color=0xffa6e3a1              \
                                  drawing=on                         \
                                                                     \
           --add   bracket        spaces_1                           \
                                  spaces_1.label                     \
                                  spaces_1.idle                      \
                                  spaces_1.misc                      \
                                  spaces_1.doc                       \
                                  spaces_1.help                      \
                                  spaces_1.music                     \
                                  spaces_1.nine                      \
                                                                     \
           --set   space_template associated_display=2               \
                                                                     \
           --clone spaces_2.label label_template                     \
                                  label.width=38                     \
                                  label.align=center                 \
                                  associated_display=1               \
                                  position=left                      \
                                  drawing=on                         \
                                                                     \
           --clone spaces_2.code  space_template                     \
           --set   spaces_2.code  associated_space=7                 \
                                  icon=                           \
                                  icon.color=0xffe0819d    \
                                  icon.highlight_color=0xffe0819d    \
                                  icon.background.color=0xffe0819d   \
                                  drawing=on                         \
                                  icon.font="Font Awesome 6 Brands:Regular:15.5"              \
                                                                     \
           --clone spaces_2.tex   space_template                     \
           --set   spaces_2.tex   associated_space=8                 \
                                  icon=                           \
                                  icon.color=0xff6c82ce   \
                                  icon.highlight_color=0xff6c82ce   \
                                  icon.background.color=0xff6c82ce    \
                                  drawing=on                         \
                                                                     \
           --clone spaces_2.web   space_template                     \
           --set   spaces_2.web   associated_space=9                 \
                                  icon=                           \
                                  icon.color=0xff3fbeb6      \
                                  icon.highlight_color=0xff3fbeb6      \
                                  icon.background.color=0xff3fbeb6   \
                                  drawing=on                         \
                                                                     \
           --add   bracket        spaces_2                           \
                                  spaces_2.label                     \
                                  spaces_2.code                      \
                                  spaces_2.web                       \
                                  spaces_2.tex                       \
                                  spaces_2.web                       \

