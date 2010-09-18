Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OwwSZ-0001wa-J7
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Sep 2010 14:24:04 +0200
Received: by iwn2 with SMTP id 2so2761912iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Sep 2010 05:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=6nUwJCOL/RgwUa/rv89wi4cwKGgl62Hb8Lq3XEMa7AU=;
	b=M5Icw682b1scBgcrLeH/FOasHoMONAOE4vvbQWm4sTl+pM3yCBAvwpBF8K0OGIlDm1
	8xjv+a/G03D0h1OW9OR/MRnH5sfnf//5yYAem0WUEWM8FldsjV1JShSnVCmO3OXTGCX1
	4htT/cYB/mvv9O1jomvteGtdgI1B86hmrVSTc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=tOR2cgAy87Tm9dRng3v5Akt5uLNv2zEMQOc8w2mzkZISVJ0Zv31XJqlKPmx7Mqv9EG
	bqckVhUEjhfWBdvguPDq9Lkg4CcoPMty/y9E6nNjQlGfHM4oAUGpgw1eDqGsZ6pMt9wb
	Uf9VqwzLyDXV/0FnNPcTBtD/E1cZpS2l6915I=
MIME-Version: 1.0
Received: by 10.231.148.195 with SMTP id q3mr6757349ibv.199.1284812581509;
	Sat, 18 Sep 2010 05:23:01 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Sat, 18 Sep 2010 05:23:01 -0700 (PDT)
In-Reply-To: <20100918120159.GD11041@excalibur.local>
References: <AANLkTinBaSVr_fd0TXnTjFk1LcJ2nGm9hgHGzkVg7riX@mail.gmail.com>
	<20100918120159.GD11041@excalibur.local>
Date: Sat, 18 Sep 2010 14:23:01 +0200
Message-ID: <AANLkTi=FN=3arG7reSOrt=KWyA-HeGauzr7_zh+ssF5Q@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: svn://svn.om.vptt.ch issue
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
X-List-Received-Date: Sat, 18 Sep 2010 12:24:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/18 Stefan Schmidt <stefan@datenfreihafen.org>:
> Hello.
>
> On Sat, 2010-09-18 at 13:28, Frans Meulenbroeks wrote:
>> Not sure if this is permanent but the following 5 recipes did not fetch for me:
>>
>> /home/frans/oe/openembedded/recipes/e17/bubble-keyboard_svn.bb
>> /home/frans/oe/openembedded/recipes/e17/essential-dialer_svn.bb
>> /home/frans/oe/openembedded/recipes/e17/gridpad_svn.bb
>> /home/frans/oe/openembedded/recipes/e17/intuition_svn.bb
>> /home/frans/oe/openembedded/recipes/efl1/libefso_svn.bb
>>
>> These all fetch from svn.om.vptt.ch
>>
>> Anyone any idea on this?
>
> I just checked back with the guys hosting the svn and it should be available. He
> promised me to check back with the admin on monday. So please keep the recipes.
>
>
Sure. It was not a removal request, just trying to find out what was wrong.
Thanks for the info!

Frans.


