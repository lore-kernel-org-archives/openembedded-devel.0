Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PK4cE-0002Nt-BS
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 08:45:39 +0100
Received: by gwaa11 with SMTP id a11so3706883gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Nov 2010 23:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=q2UG2is2deMIHnDCzM8BVo38ysP5mL1ES5E1hI1ZNqY=;
	b=tnW1CuyATBmDCOoFIWC54KA9lzuA+ilyPuTW/a+ZmhCtTYbPxvsvasK9+q8olMcbo5
	JIRaNLBgZcuZVvqQKSkcDIQtrYB5eA4dh0ZCVmf0c5du73PR3lHMM7Fn9wvVXRWHPNxJ
	3tAicgXaalyV76hunwpmHTzVRApJ+Vid3C2EM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=bE2g6gK1Df6y0uknvUdoguWWrumyVPxwZbsjK3yNCcbyJfDa7tIoaVcRfr06Q+6V8q
	Krf/24wXIZx2P13gJJz+fDb/c4MsaOiD6gFXr6RaejWLb0O4C7THe+m0Lp6XgifBPtTG
	pbW6o/1esoJnGCgmqW4kRmuYTGCIvzIUxwOck=
Received: by 10.91.51.19 with SMTP id d19mr5273993agk.183.1290325465644; Sat,
	20 Nov 2010 23:44:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Sat, 20 Nov 2010 23:44:04 -0800 (PST)
In-Reply-To: <AANLkTin9XtX07=hVvdyV19uU4PnJPm+7Aqx2qaw=41Vw@mail.gmail.com>
References: <AANLkTinsyLsC1DqEbaOQscF-GZJFiLBsL8uFouyPEzg2@mail.gmail.com>
	<AANLkTin9XtX07=hVvdyV19uU4PnJPm+7Aqx2qaw=41Vw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Nov 2010 23:44:04 -0800
Message-ID: <AANLkTinBZfAU-EKbUBq1E9rtuPMF_i6Q39UeGhoXpiLH@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Sun, 21 Nov 2010 07:45:39 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Nov 20, 2010 at 4:42 PM, Yury Bushmelev <jay4mail@gmail.com> wrote:
> 2010/11/20 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
>> HI,
>>
>> Today Jay mentioned on irc that handhelds.org is down permanently.
>
> Sorry, but that was only my assumption :)
>
>> We have at least 36 recipes that fetch from it.
>> What are we doing with these?
>>
>> One of the recipes that became unbuildable is update-rc.d which is in
>> the dependency list of a lot of recipes ....
>
> I hope someone will upload that files on one of our mirrors.


they are now on sources.openembedded.org

>
> I have following files published on http://jay-home.ath.cx/handhelds.org/
> --
> apps.update-rc.d_anoncvs.handhelds.org_r0_7_.tar.gz
> apps.update-rc.d_anoncvs.handhelds.org_r0_7_.tar.gz.md5
> ipkg-utils_anoncvs.handhelds.org__20050930.tar.gz
> ipkg-utils_anoncvs.handhelds.org__20050930.tar.gz.md5
> opie.apps_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.apps_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.applets.aboutapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.applets.aboutapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.applets.batteryapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.applets.batteryapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.applets.clockapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.applets.clockapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.applets.homeapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.applets.homeapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.applets.irdaapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.applets.irdaapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.applets.logoutapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.applets.logoutapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.applets.multikeyapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.applets.multikeyapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.applets.rotateapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.applets.rotateapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.applets.screenshotapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.applets.screenshotapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.applets.suspendapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.applets.suspendapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.applets.volumeapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.applets.volumeapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.applets.vtapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.applets.vtapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.apps.calibrate_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.apps.calibrate_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.apps.qcop_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.apps.qcop_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.apps.qss_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.apps.qss_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.apps.textedit_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.apps.textedit_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.launcher_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.launcher_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.obex_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.obex_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.opiealarm_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.opiealarm_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.pim.addressbook_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.pim.addressbook_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.pim.datebook.holiday.birthday_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.pim.datebook.holiday.birthday_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.pim.datebook_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.pim.datebook_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.pim.notes_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.pim.notes_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.pim.osearch_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.pim.osearch_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.pim.today.plugins.addressbook_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.pim.today.plugins.addressbook_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.pim.today.plugins.datebook_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.pim.today.plugins.datebook_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.pim.today.plugins.todolist_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.pim.today.plugins.todolist_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.pim.today_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.pim.today_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.pim.todo_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.pim.todo_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.settings.button_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.settings.button_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.settings.citytime_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.settings.citytime_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.settings.launcher_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.settings.launcher_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.settings.light-and-power_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.settings.light-and-power_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.settings.security_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.settings.security_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.core.tools.quicklauncher_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.core.tools.quicklauncher_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.etc.qimpen_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.etc.qimpen_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.etc_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.etc_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.freetype_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.freetype_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.inputmethods.handwriting_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.inputmethods.handwriting_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.inputmethods.multikey_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.inputmethods.multikey_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.inputmethods.pickboard_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.inputmethods.pickboard_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.libopie2_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.libopie2_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.libqtaux_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.libqtaux_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.library_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.library_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.applets.autorotateapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.applets.autorotateapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.applets.brightnessapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.applets.brightnessapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.applets.cardapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.applets.cardapplet_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.apps.advancedfm_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.apps.advancedfm_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.apps.opie-console_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.apps.opie-console_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.decorations.flat_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.decorations.flat_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.decorations.liquid_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.decorations.liquid_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.decorations.polished_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.decorations.polished_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.graphics.drawpad_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.graphics.drawpad_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.net.opietooth.lib_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.net.opietooth.lib_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.securityplugins.pin_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.securityplugins.pin_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.settings.appearance2_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.settings.appearance2_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.settings.backup_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.settings.backup_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.settings.doctab_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.settings.doctab_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.settings.language_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.settings.language_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.settings.mediummount_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.settings.mediummount_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.settings.netsystemtime_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.settings.netsystemtime_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.settings.networksettings_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.settings.networksettings_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.settings.packagemanager_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.settings.packagemanager_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.settings.sysinfo_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.settings.sysinfo_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.styles.flat_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.styles.flat_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.styles.fresh_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.styles.fresh_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.styles.liquid_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.styles.liquid_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.styles.metal_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.styles.metal_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.styles.phase_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.styles.phase_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.styles.web_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.styles.web_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.noncore.tools.clock_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.noncore.tools.clock_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.pics-hires_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.pics-hires_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.pics_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.pics_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.root_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.root_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.rsync_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.rsync_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.share_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.share_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
> opie.sounds_anoncvs.handhelds.org_v1_2_4_.tar.gz
> opie.sounds_anoncvs.handhelds.org_v1_2_4_.tar.gz.md5
>
>
> --
> Yury Bushmelev
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


