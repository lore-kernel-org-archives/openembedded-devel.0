Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OtDih-0000NE-57
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 08:01:31 +0200
Received: by iwn2 with SMTP id 2so5955859iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 23:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=/romZGcm+BWwKPKvcp0TwL5qrZuw7HTnK1bhny/M6Gk=;
	b=pcB1GJPEdAyX+8VpU2Q8Cnp+NmVMTC7UPQx/lDRYjuuUf7zInBrgppRoS5jjN0Jznm
	R4BUYn6xB3deqZldSBS7dHhtOoNrFOdsUgl0PWwdOS7+PYo2HBDJ/KEnDxtIhzkjDIJE
	4+lFUFRl+fbOlXYRcq+H6+gavGGLP8FrTdUDY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=upt0qgqte9ji6oWovNfXv/t0pHiUdRmibA1QFWOiV4jxk6ueg2vzHXwYgRCrv9bh5Y
	u/pP4Y8bkOF2nhE+fsG7U7IitrjAc40Tg+a8UimrQTDW9Q06zamZEqVJ0qO9TmynJUrz
	YGetgu1bxu3r8zxjOoujYmHfJPxdTFge8brT8=
MIME-Version: 1.0
Received: by 10.231.169.210 with SMTP id a18mr9337486ibz.5.1283925626413; Tue,
	07 Sep 2010 23:00:26 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Tue, 7 Sep 2010 23:00:26 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1009072155300.22847@asterix.crazy-teaparty.dyndns.org>
References: <1281677417-15063-1-git-send-email-vjensen@gmx.de>
	<alpine.LNX.2.00.1008131040070.11048@asterix.crazy-teaparty.dyndns.org>
	<AANLkTikQ5qGF4N1N0Ud11cdS7P4+HxfPEXSvWwMvm4YV@mail.gmail.com>
	<alpine.LNX.2.00.1008131154370.11048@asterix.crazy-teaparty.dyndns.org>
	<AANLkTinChtk+VTgQ4H3+sMfyTRUQks+=YQR9Agj8M7a_@mail.gmail.com>
	<alpine.LNX.2.00.1008132255040.11048@asterix.crazy-teaparty.dyndns.org>
	<1281734825.3858.281.camel@mattotaupa>
	<alpine.LNX.2.00.1009072155300.22847@asterix.crazy-teaparty.dyndns.org>
Date: Wed, 8 Sep 2010 08:00:26 +0200
Message-ID: <AANLkTinKX5VfcTOwmzj=e2=d5NgY4x=z=GYhsG-21Lsh@mail.gmail.com>
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
Subject: Re: patch queue/patchwork: How should states be used?
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
X-List-Received-Date: Wed, 08 Sep 2010 06:01:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/7 Vitus Jensen <vjensen@gmx.de>:

>
> BTW: who removes patches from patchwork? =A0I do have some patches in
> "Superseded" state which I no longer care about.

You can do that yourself. If I recall correctly it requires that you
create an account on patchwork with the same email address as the
patches come from.

Frans


