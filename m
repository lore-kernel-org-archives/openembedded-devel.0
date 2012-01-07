Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>)
	id 1RjdPQ-0006SP-OG; Sat, 07 Jan 2012 22:02:36 +0100
Received: by lami14 with SMTP id i14so854112lam.6
	for <multiple recipients>; Sat, 07 Jan 2012 12:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=PrEN0g7NotVMw/r6VECP/v9olW24QvrVAYagApjaQsA=;
	b=NQeU1CDFIgU3j/6KXFMmH24HObygPfbkOhvsRb+nTe1MTh/hDYWPdJKi3JQQ50jvco
	rYtucCYjRDsXPxNYV72ssnc6xrSjaz15RE65G/eZD7zVNMy9WPUOmcVKdYrWLMZGZkjR
	Tz6T8p2b81fSLxT3fEgHzj4snhq3fuluTIDUQ=
MIME-Version: 1.0
Received: by 10.112.25.35 with SMTP id z3mr2157714lbf.52.1325969710886; Sat,
	07 Jan 2012 12:55:10 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.48.69 with HTTP; Sat, 7 Jan 2012 12:55:10 -0800 (PST)
Date: Sat, 7 Jan 2012 18:55:10 -0200
X-Google-Sender-Auth: FTVzwUNDsY-E88RqCzYjVcsw_TE
Message-ID: <CAP9ODKo3pKs6Aq9oQ+GAD-Pyucv21MiOubEEp5GW+55W0rEHjQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [ANNOUNCE] Meta-Mozilla Layer available
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
X-List-Received-Date: Sat, 07 Jan 2012 21:02:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

We at O.S. Systems were using OE-Classic for all products needing Firefox
and we decided to move over OE-Core + Meta-OE for those. As result we just
finished making OE-Classic versions of Firefox, Firefox-l10n and
Firefox-Addons available at our new layer. Please look at:

https://github.com/OSSystems/meta-mozilla

If you use Firefox please take a look and try this layer. If possible, help
us to update the versions available on it so we avoid duplicated work :-)

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

