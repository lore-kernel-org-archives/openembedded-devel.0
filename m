Received: from mail-iw0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <karuppuswamy@gmail.com>) id 1NjqjE-0007eb-9t
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 10:06:55 +0100
Received: by iwn9 with SMTP id 9so3139453iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 01:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:from:date:message-id
	:subject:to:content-type;
	bh=oNkDiOOtvjPOsIg+PPGuGWjrOv/4F1A33jg1oL/RLBk=;
	b=NOYaNd9ps7mdhBFB13tuML95Gv9IaCfUw76KFaG3Wwjq55a1UX8wNxuA0ls7GL7hun
	Py9yKsjnB08xDxkvIQ6eEIXSBXs11nGzb/UOAUAbtwgvJtgNwELKUF72eIJ3p/wAFhN3
	EUqpdDG//hO+g5yVaPPA0phcDCNsxwPdgK8Go=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=gctIKB+YV5hF2E3P6VCzegrH+ohtGG4+K/TvricXdaWsonkcHdL/S7R4p9g9gteprC
	YkdPGP/1bturUH7KHhq0kZlGr6rK3wqP5zTSA1EsAatJ991DewFyM8wMCRNT/gT0k7JJ
	5DxQ1BLwWNrqG8uNAfsCymc6fDRtRlEFJoKrk=
MIME-Version: 1.0
Received: by 10.231.153.69 with SMTP id j5mr857268ibw.33.1266915847133; Tue, 
	23 Feb 2010 01:04:07 -0800 (PST)
From: KaruppuSwamy T <karuppuswamy@gmail.com>
Date: Tue, 23 Feb 2010 01:03:47 -0800
Message-ID: <a1da1e5e1002230103k33369a5j2be39f66400aab8c@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.179
X-SA-Exim-Mail-From: karuppuswamy@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Linux on Nokia 5800
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
X-List-Received-Date: Tue, 23 Feb 2010 09:06:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

I have installed openembedded to get familiar with embedded linux development.
I have some good experience in building the linux from scratch (lfs)
and using gentoo for some time.

To play with real hardware, I have got my wife's Nokia 5800 which
seems to be a crap for day to day use. So I am dedicating this mobile
for my embedded linux play.

Please let me know how to start with it to develop an image for
Nokia 5800. How to target (customize) the arm build for this device?
It seems to be Nokia 5800 is based on ARM11 processor. My aim is not
to run a Mobile app in it, instead a linux distro.


