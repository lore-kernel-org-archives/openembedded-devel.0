Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TevVs-0000vG-2h
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Dec 2012 23:26:20 +0100
Received: by mail-ia0-f175.google.com with SMTP id z3so1305497iad.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Dec 2012 14:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=R/eBvmeczZ2VzoWmL5GQ6J3Il06tM0+0qBN78NDyHd8=;
	b=YK8G+rMlw/8H3RWlTSfIy4Ywcmd7NusVOL8LmfrHcpNs/xBzEcDsUF27F/2LiwWW1t
	EGvJ85u6aLkGcAzis4FVXmGJIm7MUn13Tlu77vQ7xfLOGIpkD4UcOaoAwDcUPYwQusEx
	IxYB7NT/tap83COVBZ2eMbaNW4PGDUF6sHIoC7f5t8po/RDhx3Kf25uS1O8eg1wAPjEX
	Dc3HDKQQr9l+DvCKiXDQQW/lj9FR6Woy06Gd5uOMQRUN/K7dqqsKk16s5TZ7kSp9gl6a
	PShgg4IY21wVGNOZLBaZ9KEAj3ctUWLbpo3pKu7xs/0RUfGTQsPiykJy01VboNqZpQq1
	JIBw==
MIME-Version: 1.0
Received: by 10.43.49.199 with SMTP id vb7mr4424863icb.6.1354399920569; Sat,
	01 Dec 2012 14:12:00 -0800 (PST)
Received: by 10.64.24.175 with HTTP; Sat, 1 Dec 2012 14:12:00 -0800 (PST)
In-Reply-To: <3372743.V6Z4Mr4vuB@helios>
References: <1354354717-1024-1-git-send-email-cazfi74@gmail.com>
	<3372743.V6Z4Mr4vuB@helios>
Date: Sun, 2 Dec 2012 00:12:00 +0200
Message-ID: <CAF6bG8fwWSuemoc1kKJVHKUt8KJ5F4WR_WskTyoPJw26C3Qf+w@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] fakeroot: update to upstream version 1.18.4
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
X-List-Received-Date: Sat, 01 Dec 2012 22:26:20 -0000
Content-Type: text/plain; charset=UTF-8

On 1 December 2012 14:14, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Saturday 01 December 2012 11:38:37 Marko Lindqvist wrote:
>> License is now GPLv3
>>
>> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
>> ---
>
> Just out of interest, are you (or is anyone else for that matter) using
> fakeroot in preference to pseudo which we already build as part of the normal
> build process?

 I'm not at the moment. Later I may bring to OpenEmbedded environment
some scripts that use fakeroot, but even then adjusting the scripts is
an option.


 - ML


