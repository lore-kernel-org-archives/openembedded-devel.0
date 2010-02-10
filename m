Received: from mta9.brinkster.com ([65.182.109.78])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1NfJwu-0003vH-3y
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 22:18:19 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta9.brinkster.com (Postfix) with ESMTP id A1B6D248075
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 16:06:14 -0500 (EST)
X-Virus-Scanned: amavisd-new at 
Received: from mta9.brinkster.com ([127.0.0.1])
	by localhost (mta9.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6dpKhxUwGmnd
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 16:06:10 -0500 (EST)
Received: from MareImbrium (cpc1-bath2-0-0-cust327.aztw.cable.virginmedia.com
	[82.46.19.72])
	by mta9.brinkster.com (Postfix) with ESMTP id 9F831493F38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 16:06:09 -0500 (EST)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
References: <B5065796495AFE4CA0A151FCB7BAE0120423EDC2B7@s-zera-ex01.zera.local>
In-Reply-To: <B5065796495AFE4CA0A151FCB7BAE0120423EDC2B7@s-zera-ex01.zera.local>
Date: Wed, 10 Feb 2010 21:05:59 -0000
Message-ID: <001001caaa94$d93632d0$8ba29870$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Acqqj2QGqQXu97fIS82SPRbJG8v0UAAA16fA
X-SA-Exim-Connect-IP: 65.182.109.78
X-SA-Exim-Mail-From: John.Willis@Distant-earth.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: xfwm4 themes from xfwm4-themes are not packed
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
X-List-Received-Date: Wed, 10 Feb 2010 21:18:19 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

Dear Andreas,

> I created a recipe for xfce/xfwm4/slim. After everything working fine
> so far, I tried to make it more colorful and check the xfwm4-themes.
> Doing so, I had to realize that all the themes coming from xfwm4-
> themes(-4.6.0) are not packed and are not found in rootfs
> /usr/share/themes. The themes included in xfwm4 can be found.

Most of the Xfce 4.6.* work was done by myself and while I have not
encountered any issues with the themes for the Xfce Window Manager I can see
after reviewing the recipes that there is some room for improvement in the
xfwm4-themes recipe (your quite right, it's not working as it should and is
also not very clever).

Leave this with me for a few days and I'll get things cleaned up and
submitted for inclusion in OpenEmbedded.

Regards,

John Willis




