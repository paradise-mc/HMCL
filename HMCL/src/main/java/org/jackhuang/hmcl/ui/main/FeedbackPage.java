/*
 * Hello Minecraft! Launcher
 * Copyright (C) 2021  huangyuhui <huanghongxun2008@126.com> and contributors
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
package org.jackhuang.hmcl.ui.main;

import javafx.scene.control.ScrollPane;
import javafx.scene.layout.VBox;
import org.jackhuang.hmcl.Metadata;
import org.jackhuang.hmcl.theme.Themes;
import org.jackhuang.hmcl.ui.FXUtils;
import org.jackhuang.hmcl.ui.WeakListenerHolder;
import org.jackhuang.hmcl.ui.construct.ComponentList;
import org.jackhuang.hmcl.ui.construct.LineButton;
import org.jackhuang.hmcl.ui.construct.SpinnerPane;

import static org.jackhuang.hmcl.util.i18n.I18n.i18n;

public class FeedbackPage extends SpinnerPane {

    private final WeakListenerHolder holder = new WeakListenerHolder();

    public FeedbackPage() {
        VBox content = new VBox();
        content.getStyleClass().add("spinner-pane-content");
        ScrollPane scrollPane = new ScrollPane(content);
        scrollPane.setFitToWidth(true);
        FXUtils.smoothScrolling(scrollPane);
        setContent(scrollPane);

        ComponentList paradise = new ComponentList();
        {
            var website = LineButton.createExternalLinkButton(Metadata.PARADISE_WEBSITE_URL);
            website.setLargeTitle(true);
            website.setLeading(FXUtils.newBuiltinImage("/assets/img/paradise.png"));
            website.setTitle(i18n("contact.paradise.website"));
            website.setSubtitle(i18n("contact.paradise.website.statement"));

            var qqGroup = LineButton.createExternalLinkButton(Metadata.PARADISE_QQ_GROUP_URL);
            qqGroup.setLargeTitle(true);
            qqGroup.setLeading(FXUtils.newBuiltinImage("/assets/img/paradise-qq.png"), 32);
            qqGroup.setTitle(i18n("contact.paradise.qq_group"));
            qqGroup.setSubtitle(i18n("contact.paradise.qq_group.statement"));

            var heihe = LineButton.createExternalLinkButton(Metadata.PARADISE_HEIHE_CHAT_URL);
            heihe.setLargeTitle(true);
            heihe.setLeading(FXUtils.newBuiltinImage("/assets/img/paradise-heybox.png"), 32);
            heihe.setTitle(i18n("contact.paradise.heihe"));
            heihe.setSubtitle(i18n("contact.paradise.heihe.statement"));

            paradise.getContent().setAll(website, qqGroup, heihe);
        }

        ComponentList feedback = new ComponentList();
        {
            var github = LineButton.createExternalLinkButton("https://github.com/HMCL-dev/HMCL/issues/new/choose");
            github.setLargeTitle(true);
            github.setTitle(i18n("contact.feedback.github"));
            github.setSubtitle(i18n("contact.feedback.github.statement"));

            holder.add(FXUtils.onWeakChangeAndOperate(Themes.darkModeProperty(), darkMode -> {
                github.setLeading(darkMode
                        ? FXUtils.newBuiltinImage("/assets/img/github-white.png")
                        : FXUtils.newBuiltinImage("/assets/img/github.png"));
            }));

            feedback.getContent().setAll(github);
        }

        content.getChildren().addAll(
                ComponentList.createComponentListTitle(Metadata.FORK_NAME),
                paradise,
                ComponentList.createComponentListTitle(i18n("contact.feedback")),
                feedback
        );
    }
}
