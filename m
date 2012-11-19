Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TaOtw-0006BF-Ss
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2012 11:48:29 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so1741475pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2012 02:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=q4jR0DUrdWrKhyENklBup+M4iIwyexT9p3gLOOKAyvQ=;
	b=aM6RBpCuPQDzqytE2U/tbRTMtvZGHy4epL3Wyk6T5z4SMO2eNRo2B+xt0Lvwyie8Ga
	tZv7Als2HdBMtOT8KluJV4PbW+u6lsHYt1t0Lg1k98nGyCv1/5CuPmlZKlxCANMP2Noe
	k1z5IFrIWXtfd+X32MBccJh3AMHmaaKNybkt8keP2o039gXBVm8JFjQ0eYK5tSw8fwDL
	t58lo7bJiAlzNMWyf70CCeq/BKLejJywYNeLJDJGlonIgf9RI4mP5CZcPoJD9PI7XjNC
	I3j8HJ8EYLT42f7GpDN6lvv5Mi5QMWAi2ggI3QSRDeQu1XCs1LeS76GxPRIOtQT1mAfE
	AffQ==
MIME-Version: 1.0
Received: by 10.68.204.103 with SMTP id kx7mr32073794pbc.33.1353321266109;
	Mon, 19 Nov 2012 02:34:26 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Mon, 19 Nov 2012 02:34:26 -0800 (PST)
In-Reply-To: <1353031219-16200-1-git-send-email-b40290@freescale.com>
References: <1353031219-16200-1-git-send-email-b40290@freescale.com>
Date: Mon, 19 Nov 2012 08:34:26 -0200
X-Google-Sender-Auth: h_eXzt2kkhi_S2P6K8teGMYfg2I
Message-ID: <CAP9ODKpfdpS3ULMNPig7d-n+2y5tvvvKmHi+1fP8UP+E=dqtDA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: B29882@freescale.com, B19537@freescale.com
Subject: Re: [meta-networking v5 ] inetutils : Update to 1.9.1
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
X-List-Received-Date: Mon, 19 Nov 2012 10:48:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 16, 2012 at 12:00 AM, Chunrong Guo <b40290@freescale.com> wrote:

>   * There are difference spaces between  inetutils-1.8/COPYING
>     and inetutils-1.9.1/COPYING,so md5sum is changed.
>
> Signed-off-by: Chunrong Guo <b40290@freescale.com>
>

I did not built or tested it but the commit log might be improved to
express what happened to the patches you removed. I assume they were fixed
upstream but it is not clear looking at the changes or commit log.

Please make it explicit.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

