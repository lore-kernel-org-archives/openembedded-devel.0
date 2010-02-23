Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vivektambakad@gmail.com>) id 1NjosL-0006RM-Pz
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 08:08:12 +0100
Received: by gyd5 with SMTP id 5so244517gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2010 23:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=CkKklDpVg6Ag2KDPBTxDokMwEGH8hqaNLU/Cyhq3veU=;
	b=Uaec8muEGrSYnb/6mnuLXjgpwMZVbTulLzdsBl5lBTDsYGwcSwhrjK58zME+i52hL8
	xs1hG7g0e+Za7CHAr33AcRLtHzvRrt48aGzqf1bPbkXE8rjnrSx7oLHDgrrD/eNWE/Oy
	bGUZubvhG051CV1Q+aG89tNHOLDcDAN0bfsz0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=p2nvg/3N9SrW6ksKzuszwBHYfnRYgxyMkmIPMnOktJQNfQoyVGknYArGPK0TGt9wbc
	WxZnhLMGYOhuuWsSbaFi1COaTwn8fxNel4oMb+LzneyLQcspArN9BRQltNqz4Yl/fHBz
	vkxxOLPrfBOYmYGn/1xIe9/VVlnwAgxXjNb4w=
MIME-Version: 1.0
Received: by 10.90.40.17 with SMTP id n17mr5594474agn.3.1266908724403; Mon, 22 
	Feb 2010 23:05:24 -0800 (PST)
Date: Tue, 23 Feb 2010 12:35:22 +0530
Message-ID: <ad82c8891002222305g5bbcae45te6a4836c83717076@mail.gmail.com>
From: vivek tambakad <vivektambakad@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: vivektambakad@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: ERROR: Please set the 'PERSISTENT_DIR' or 'CACHE' variable
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
X-List-Received-Date: Tue, 23 Feb 2010 07:08:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
          I am building "bitbake x11-image". I get following error
ERROR: Please set the 'PERSISTENT_DIR' or 'CACHE' variable

I have set path correctly and infact build x11-image previously.
I installed some packages "php5 php5-cli php5-mysql mysql-server php-pear
php-db openssh-server" for
asterisk  application. Is the above installed packages create any conflict
with openembedded.
I am getting this error after installing these packages.

with regards
vivek tambakad

