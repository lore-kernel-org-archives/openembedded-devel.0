Received: from mail-pz0-f184.google.com ([209.85.222.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vivektambakad@gmail.com>) id 1NcZ18-00069I-W0
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 07:47:18 +0100
Received: by pzk14 with SMTP id 14so959260pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Feb 2010 22:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=K/huw9tYeuGxa8DwJhks1xyM9pxLw4llx2pHmA6JLV4=;
	b=w0wH9mq6g3p3nbOS6645SoWqG/tAxvzZDSTXSFyzzJFyIQd/BCOM2FvOdE37LQgqr7
	pGmNGGz1kODODKaXf3lAhUx1M5lUcJtcJXwvNR7do/8/WrbttS2r+1Ksb/3B41bKBnJv
	CtGU2uKMFWvrOH6RrSu8t2S3vnb9tFn5bWwsc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=SMuh0UDxcDQ7Vx4WALiW5MjuLxTp8TXr2Jp97mNt6cAwBXYtrIPxPhp+1OcovN+iL4
	X5w60Ol2D+EviNrWBSTNBk6P9hUKxoYed3XYZwQf9OzSuZoqHhpIX6pXFvXn515SIrLx
	6cNXccF9Wjxk+zrok5SV//tGhBeeGsv5faWCg=
MIME-Version: 1.0
Received: by 10.114.251.18 with SMTP id y18mr4822189wah.51.1265179486631; Tue, 
	02 Feb 2010 22:44:46 -0800 (PST)
Date: Wed, 3 Feb 2010 12:14:45 +0530
Message-ID: <ad82c8891002022244ic33360do6596413f17d95972@mail.gmail.com>
From: vivek tambakad <vivektambakad@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.184
X-SA-Exim-Mail-From: vivektambakad@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Touchscreen is not working in compulab Em-x270
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
X-List-Received-Date: Wed, 03 Feb 2010 06:47:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
       I have ported x11-image onto the compulab Em-x270 board, but
touchscreen is not working.
The touchscreen kernel modules are present and i think there is problem in
user space.I tried following command:
*export TSLIB_TSDEVICE**=/dev/input/touchscreen0*
 Please guide me in solving this issue.

with regards
vivek tambakad

