Received: from fg-out-1718.google.com ([72.14.220.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NCbu2-0001Zg-Ah
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 17:36:41 +0100
Received: by fg-out-1718.google.com with SMTP id d23so2229743fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 08:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=lQwrMFCcz89RySbhgzDOZqleQ3o2bxY+Ev5cQVZGf9k=;
	b=a4KKC1qDU0myVxuHHaa22cETS6wcGiKTXY6lZQcNAi6BsT2+jrRinUN0xSiAiph4QY
	hb4casbO1kuUwwTE9P/SL/1zu6hDgLcXcPUs4rkDePH8bPg1wv0sT7jiyBTrN5xS4Nrh
	QDMT1pG/8opleiBIHOtm/+ZsAY3EWqDskIoC8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=iKoz1l6TFBLjiBGj+jrA6gOFgS0HUoB3uwptqoa97+xqmSFe5Ewzw4MsSrIrlGqEw3
	Ocs3bcHz0l190EOB0tMlxp9X8tu9VOTuz3lU6M9vwZ7S1qIpT1LVH1Ks4j+5km2FNYL8
	1YqTwDNFKJO1m3sGnco+B4brhtd2vdBgWSi48=
MIME-Version: 1.0
Received: by 10.239.144.97 with SMTP id n33mr472172hba.183.1258994112339; Mon, 
	23 Nov 2009 08:35:12 -0800 (PST)
Date: Mon, 23 Nov 2009 17:35:12 +0100
Message-ID: <c384c5ea0911230835h20b388f8q81ab96b8bc82601e@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 72.14.220.152
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Please indicate *why* in the commit messages; commit "kernel.bbclass: 	force do_deploy call before do_build"
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
X-List-Received-Date: Mon, 23 Nov 2009 16:36:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Martin,

especially for changes to core files (such as kernel.bbclass) could
you indicate in the commit message not only *what* has changed but
also *why*?

Your commit message leaves me only guessing for the why:

kernel.bbclass: force do_deploy call before do_build
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


Thanks!

Regards,
-- 
Leon


