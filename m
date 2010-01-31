Received: from mail-pz0-f171.google.com ([209.85.222.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NbSU0-0005PV-Fj
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 06:36:34 +0100
Received: by pzk1 with SMTP id 1so3726063pzk.16
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 21:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=dh1DRopc7xcbWBXzsNIaZfk3j0TUx7X0Ync24/MQfUo=;
	b=t9TXlMxLJ8CwYLbRAcpVBWBS5mfUjzAwCMchZYYypD8wvXwKp+b5qnyaySGU2fcSl+
	1fzL55Vs5d+TojFS5fTnXD62pSs5umObZfTNW0OFB7WWbjEScocrpNh8ezfBOpbt7qWs
	vOjGUixX40nzpX9tZrm8MIM1aXlEgSDkye864=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=bfXqoz7Q52FlMY/qwciNcTTi+6CEhK44FGIg0zrUyqLd5jFZR6K/m3WJS2+V2tZXO/
	U50Z0X1A9vyA4N4DmAZBcrtkHrvzk1HVnvEgXjHFf6w5AYAKYo33tUFamGHGozbTEFwI
	MhgC7Z7AtBA54QyxJYNn4lWAWZtg2UbsfjiSA=
Received: by 10.141.13.6 with SMTP id q6mr1975388rvi.146.1264916042521;
	Sat, 30 Jan 2010 21:34:02 -0800 (PST)
Received: from camelguo ([123.54.107.86])
	by mx.google.com with ESMTPS id 22sm3220489pzk.2.2010.01.30.21.33.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 30 Jan 2010 21:34:01 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u7dnj4v0mn1qzu@camelguo> <op.u7do2cw1mn1qzu@camelguo>
	<op.u7dpieeymn1qzu@camelguo> <201001310516.14421.holger+oe@freyther.de>
	<19c1b8a91001302123te743d1fna73e7d8cc666971c@mail.gmail.com>
Date: Sun, 31 Jan 2010 13:33:52 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u7dtqqb0mn1qzu@camelguo>
In-Reply-To: <19c1b8a91001302123te743d1fna73e7d8cc666971c@mail.gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.222.171
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building u-boot - git failed
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
X-List-Received-Date: Sun, 31 Jan 2010 05:36:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Sun, 31 Jan 2010 13:23:58 +0800=EF=BC=8CKhem Raj <raj.khem@gma=
il.com> =E5=86=99=E9=81=93:

>> Please create a patch that can be applied to the OE tree.
> couple of months back I was hitting this error for beaglebord and had
> the same patch in my local repo but never pushed it

Please push it.


-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


