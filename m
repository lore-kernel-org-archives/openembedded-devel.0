Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1PJy2D-0005pj-HY
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 01:44:03 +0100
Received: by vws6 with SMTP id 6so689413vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Nov 2010 16:42:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.75.20 with SMTP id w20mr1054204vcj.34.1290300169240; Sat,
	20 Nov 2010 16:42:49 -0800 (PST)
Sender: jay@jay-tech.ru
Received: by 10.220.95.74 with HTTP; Sat, 20 Nov 2010 16:42:49 -0800 (PST)
X-Originating-IP: [95.29.187.131]
In-Reply-To: <AANLkTinsyLsC1DqEbaOQscF-GZJFiLBsL8uFouyPEzg2@mail.gmail.com>
References: <AANLkTinsyLsC1DqEbaOQscF-GZJFiLBsL8uFouyPEzg2@mail.gmail.com>
Date: Sun, 21 Nov 2010 03:42:49 +0300
X-Google-Sender-Auth: ubRxqMwxFnXVUd8ebvMry8ZFjeg
Message-ID: <AANLkTin9XtX07=hVvdyV19uU4PnJPm+7Aqx2qaw=41Vw@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: jay@jay-tech.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: handhelds.org
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Nov 2010 00:44:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/20 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> HI,
>
> Today Jay mentioned on irc that handhelds.org is down permanently.

Sorry, but that was only my assumption :)

> We have at least 36 recipes that fetch from it.
> What are we doing with these?
>
> One of the recipes that became unbuildable is update-rc.d which is in
> the dependency list of a lot of recipes ....

I hope someone will upload that files on one of our mirrors.

I have following files published on http://jay-home.ath.cx/handhelds.org/
-- 
apps.update-rc.d_anoncvs.handhelds.org_r0_7_.tar.gz
apps.update-rc.d_anoncvs.handhelds.org_r0_7_.tar.gz.md5
ipkg-utils_anoncvs.handhelds.org__20050930.tar.gz
ipkg-utils_anoncvs.handhelds.org__20050930.tar.gz.md5
opie.apps_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.apps_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.applets.aboutapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.applets.aboutapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.applets.batteryapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.applets.batteryapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.applets.clockapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.applets.clockapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.applets.homeapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.applets.homeapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.applets.irdaapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.applets.irdaapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.applets.logoutapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.applets.logoutapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.applets.multikeyapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.applets.multikeyapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.applets.rotateapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.applets.rotateapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.applets.screenshotapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.applets.screenshotapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.applets.suspendapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.applets.suspendapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.applets.volumeapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.applets.volumeapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.applets.vtapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.applets.vtapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.apps.calibrate_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.apps.calibrate_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.apps.qcop_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.apps.qcop_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.apps.qss_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.apps.qss_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.apps.textedit_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.apps.textedit_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.launcher_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.launcher_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.obex_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.obex_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.opiealarm_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.opiealarm_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.pim.addressbook_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.pim.addressbook_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.pim.datebook.holiday.birthday_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.pim.datebook.holiday.birthday_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.pim.datebook_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.pim.datebook_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.pim.notes_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.pim.notes_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.pim.osearch_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.pim.osearch_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.pim.today.plugins.addressbook_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.pim.today.plugins.addressbook_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.pim.today.plugins.datebook_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.pim.today.plugins.datebook_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.pim.today.plugins.todolist_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.pim.today.plugins.todolist_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.pim.today_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.pim.today_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.pim.todo_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.pim.todo_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.settings.button_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.settings.button_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.settings.citytime_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.settings.citytime_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.settings.launcher_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.settings.launcher_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.settings.light-and-power_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.settings.light-and-power_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.settings.security_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.settings.security_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.core.tools.quicklauncher_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.core.tools.quicklauncher_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.etc.qimpen_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.etc.qimpen_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.etc_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.etc_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.freetype_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.freetype_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.inputmethods.handwriting_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.inputmethods.handwriting_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.inputmethods.multikey_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.inputmethods.multikey_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.inputmethods.pickboard_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.inputmethods.pickboard_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.libopie2_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.libopie2_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.libqtaux_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.libqtaux_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.library_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.library_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.applets.autorotateapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.applets.autorotateapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.applets.brightnessapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.applets.brightnessapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.applets.cardapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.applets.cardapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.apps.advancedfm_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.apps.advancedfm_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.apps.opie-console_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.apps.opie-console_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.decorations.flat_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.decorations.flat_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.decorations.liquid_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.decorations.liquid_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.decorations.polished_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.decorations.polished_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.graphics.drawpad_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.graphics.drawpad_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.net.opietooth.lib_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.net.opietooth.lib_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.securityplugins.pin_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.securityplugins.pin_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.settings.appearance2_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.settings.appearance2_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.settings.backup_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.settings.backup_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.settings.doctab_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.settings.doctab_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.settings.language_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.settings.language_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.settings.mediummount_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.settings.mediummount_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.settings.netsystemtime_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.settings.netsystemtime_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.settings.networksettings_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.settings.networksettings_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.settings.packagemanager_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.settings.packagemanager_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.settings.sysinfo_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.settings.sysinfo_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.styles.flat_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.styles.flat_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.styles.fresh_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.styles.fresh_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.styles.liquid_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.styles.liquid_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.styles.metal_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.styles.metal_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.styles.phase_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.styles.phase_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.styles.web_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.styles.web_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.noncore.tools.clock_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.noncore.tools.clock_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.pics-hires_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.pics-hires_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.pics_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.pics_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.root_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.root_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.rsync_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.rsync_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.share_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.share_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
opie.sounds_anoncvs.handhelds.org_v1_2_4_.tar.gz
opie.sounds_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5


-- 
Yury Bushmelev


