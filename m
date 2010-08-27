Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ooxrd-0005Zm-Qz
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 14:16:58 +0200
Received: by iwn2 with SMTP id 2so2480482iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 05:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HoZb9NVMSfPjV+XCI8U25n2tHHQY4tKM6ve+iReTF1U=;
	b=GRPa1zUwhvGIFMy30alCNg4DR4ObCUOqgOxIIBUmrTpzGeO8Yibv1wrd2L5jd7dCDK
	nR7oshRGuI0+YBTtA2xr+qaGhS65IBDOC4cig0BFypr8I39Kz4x2GK7wxYJenweO0+Oj
	l1WxQN6jebw76+1UVOkKq4InPXkRZom9x3WwY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FRYQN/lUwd9ul3YpI+J7vnM0ccz3XBX3vLh8+oCyf/XPycVkho3TParvtiD81iTZfc
	nF2OoXnE0BSV2WIrNPZ3zYT7hDN2Z3n3aYePdwVFlCT2o3kUGfxkrwrXA+LvaZGb4a6C
	BX/SlqKCOLkDPHoRoHIDJ9J0eJh8A6LfeCVZE=
MIME-Version: 1.0
Received: by 10.231.34.70 with SMTP id k6mr1091670ibd.25.1282911390518; Fri,
	27 Aug 2010 05:16:30 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Fri, 27 Aug 2010 05:16:30 -0700 (PDT)
In-Reply-To: <AANLkTi=o=4pS4tLrhXErembiZ5j4ye+EzAk91yc02rya@mail.gmail.com>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>
	<i586bt$t12$1@dough.gmane.org>
	<AANLkTi=o=4pS4tLrhXErembiZ5j4ye+EzAk91yc02rya@mail.gmail.com>
Date: Fri, 27 Aug 2010 14:16:30 +0200
Message-ID: <AANLkTinruLr1OHotVwFrCkeXhbUxMzvCSRBDc-iVL7kU@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] recipes: Update recipes to get 'bitbake world' parse and calculate runqueue successfully.
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
X-List-Received-Date: Fri, 27 Aug 2010 12:16:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/27 Andrea Adami <andrea.adami@gmail.com>:
>>> =A0recipes/udev/udev-compat141_141.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A06 ++-
>>
>> NAK
>>
>
> This one is an hack in progress, needed only for Zaurus until 2.6.36
> (hopefully).
> Please keep ;)
>
> Andrea
>
>
Thanks for the explanation.

It might be good practice to add a small note to the recipe if there
is something done on purpose that can be mistaken by others as being
wrong

Frans


