Received: from [209.85.134.189] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1L9lxK-00054w-3d
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Dec 2008 20:39:46 +0100
Received: by mu-out-0910.google.com with SMTP id w1so1232960mue.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Dec 2008 11:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=vvqONEwNLFZiBfZHVdhSjwPpCxQbl0UUuekDkXWIIiE=;
	b=FEVUDs8uPQlV2L9IYu7qKdGJwAist2ePmhyyQ27dBDq4Z/EzqjFdxHdyLJI0n0qn69
	HvLEEw6L1bjk1+Ic0wBXndUDcw7U0CCceb0o3JtcjNuxHveG0XeHFpuR7RNpeyBKlsIF
	QJE0SMF/oAfGKSw579A++Dg2upIF4W39n3nOQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=BVt86sPy4GjQIS5gS0y9cWoRbkkegMeBxe7hBXiZR9D29EsxDNwkcNJjvm35LWSSlV
	GczK6gbQC4nbTu1UTAJ/xKycbHNw2Ry6qsjAY+JrsGc9zBb6Zvroz1YJ81wZ9aRbat4D
	wz0zPu2AK5Qj4y5meZQj9Rez1MAj24xBull6o=
Received: by 10.223.113.3 with SMTP id y3mr1556954fap.71.1228764953126;
	Mon, 08 Dec 2008 11:35:53 -0800 (PST)
Received: by 10.223.115.200 with HTTP; Mon, 8 Dec 2008 11:35:53 -0800 (PST)
Message-ID: <c384c5ea0812081135l44781a3fw1a43dba861a44f0f@mail.gmail.com>
Date: Mon, 8 Dec 2008 20:35:53 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: OE buildable on headless hosts?
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
X-List-Received-Date: Mon, 08 Dec 2008 19:39:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I have come across a range of problems on non-buildable stuff lately
and I think we are facing host-dependencies again wrt (at least)
GNOME.

How many people are building GNOME/X stuff on non-X hosts (such as
Ubuntu Server)?

Regards,
-- 
Leon


