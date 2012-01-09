Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RkGPj-0002au-9e
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jan 2012 15:41:32 +0100
Received: by lami14 with SMTP id i14so1338251lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jan 2012 06:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=sjc3Fo54Fr5K92CDw7Bf4HCXqg8Jh+16R4zzz3uheCE=;
	b=VpvNe+PXURkrBa0aYbYGtwhzObe+H+lRmUCfEep/dpYlNNXPtPF4QHHvMhqGUs8UP9
	HCwrGwFX28kNZjKBtJBfdsy2yvmSw0AF6gQxW718Dp4iOmzM2ejCzuQPgIGBv7/oB6ua
	Q17I6Sky5wsOoUY7lJkLGW9EizyVBRcIWrv3I=
MIME-Version: 1.0
Received: by 10.112.101.163 with SMTP id fh3mr3431045lbb.97.1326119643501;
	Mon, 09 Jan 2012 06:34:03 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.54.104 with HTTP; Mon, 9 Jan 2012 06:34:03 -0800 (PST)
In-Reply-To: <20120109134441.GB5503@ad.chargestorm.se>
References: <cover.1326114932.git.anders@chargestorm.se>
	<5fec4c565130ce5590d5073421f211898d12dc24.1326114932.git.anders@chargestorm.se>
	<20120109132816.GB3936@jama.jama.net>
	<20120109133703.GA5503@ad.chargestorm.se>
	<20120109134441.GB5503@ad.chargestorm.se>
Date: Mon, 9 Jan 2012 12:34:03 -0200
X-Google-Sender-Auth: OlOU_KeH3CYD17944QPOr80ef_M
Message-ID: <CAP9ODKoPwqC47oCi=ze5j86V_b3bebsmmjZqvddVHnThZ76wgQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 2/2] systemd: split out systemd-analyze
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
X-List-Received-Date: Mon, 09 Jan 2012 14:41:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 9, 2012 at 11:44, Anders Darander <anders@chargestorm.se> wrote:

> Just pushed the above fix to the same systemd-move branch on github.
>

Please send an updated patchset so people can review it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

