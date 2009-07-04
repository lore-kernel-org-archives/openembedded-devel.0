Received: from [209.85.212.188] (helo=mail-vw0-f188.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kirtibr@gmail.com>) id 1MMxu8-0007ts-Ia
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Jul 2009 07:35:16 +0200
Received: by vwj26 with SMTP id 26so1635138vwj.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jul 2009 22:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=umKRmI9T3lHgCx/NVHFIGTtHWtZYtnboq156prgN25I=;
	b=yEegrIZ6A14NxlrdNGkZP2YqQO7raFVbmcCE9KVL74Du1uKOckQS0eWyc2Djinf4L8
	XrmoKKncnIHBP+nomA8k9LR031Q7rZD8J/RyTvuL8Wo3Y1nD5UwM/LpXKS9S3ljyjp1z
	7ZBS7itEN8/np3tHrPbkHUOT8OIq/Z9ybfe9I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=hLIkIpj3sqwIn2SHnmIJ2IOJLc9oXyeUBcKazGZME15gEHVoUQFRMI/aiOEj6ouVIl
	tGmrHcXNinFrdB1P5B2fd0yYCENPo5SVy2msQlAav7cx3i9lu2XsTaDzPKL1wmCYDc/o
	V6ap0Y6C6jF+elV/eDDtiXlHxIhchWRjjxDgM=
MIME-Version: 1.0
Received: by 10.220.77.84 with SMTP id f20mr4205061vck.109.1246684982513; Fri, 
	03 Jul 2009 22:23:02 -0700 (PDT)
Date: Sat, 4 Jul 2009 10:53:02 +0530
Message-ID: <64d5b90a0907032223t749b13ffy95305639fcf3e654@mail.gmail.com>
From: Kirtika Ruchandani <kirtibr@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: (Possibly grave) error with Busybox recipe ?
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
X-List-Received-Date: Sat, 04 Jul 2009 05:35:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,
I was building an image for the beagleboard and happened to notice that the
busybox recipe doesn't ship a whole lot of files under
/busybox/bin,/busybox/sbin in any package.
Details here: http://pastebin.com/f35154815

Am I mistaken somewhere, or is it a bug?

-- 
Kirtika Ruchandani
Maemo Google Summer of Code  student
Sophomore, CS&E @ IIT-Madras
IRC: rkirti / oespirit
http://rkirti.wordpress.com

