Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N77wI-00039o-Ir
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 14:36:21 +0100
Received: by bwz9 with SMTP id 9so2458026bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2009 05:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=9zLUauVrYgeDcahDAr4NVo3lgdwSsKPcvMoMSfhVMho=;
	b=JQsaVjXUEBHoI3ikT5XK16V/4Ze9ruxCRSltKcf6MJ/nk9co7fL9qJUd0UuZni0MKB
	JV0kb6xkRn/1ZE99LEOR/+oTNk39Tudj4oNaTWqI5o116V5/m4ngZ2TKBCEbfEbjBM7A
	aLiQZw2VlkGW93/7Qu9zTMpQemFMZ46fPST+4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=C5zfkg9C2QYHuJgVneO5YnwSbamtbMq4yoQ/HKlJQ75uVQ7CWoG2OItX2mYQIqiBUK
	WjbraR/u/OUC4vRNgwWISGvDn+9SkeLdtAIYhrNSKqqvbkgaou/ySFN7cmslFjT6HBpW
	pFUIhykudBqkhZlMQPbn3FM+yOWHoJiCC/UMQ=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.141.145 with SMTP id c17mr606470hba.14.1257687302410; Sun, 
	08 Nov 2009 05:35:02 -0800 (PST)
In-Reply-To: <hd63e9$t75$1@ger.gmane.org>
References: <hd63e9$t75$1@ger.gmane.org>
Date: Sun, 8 Nov 2009 11:35:02 -0200
X-Google-Sender-Auth: 1347bf104668c7b1
Message-ID: <be7a9f3d0911080535w19b1b3d9q917a23023f1edcf7@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Checksums.ini sorting and updating
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
X-List-Received-Date: Sun, 08 Nov 2009 13:36:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Nov 8, 2009 at 7:36 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> 2) people having deleted(!) checksums that repear due to being in my TMPDIR
> checksum cache

I pick the specific checksum I'm going to add and add it to
conf/checksums.ini (copy it from TMPDIR/checksums.ini) so I avoid
adding non-related checksums (as you did in the tarball change) for no
reason.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


