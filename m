Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RV2MK-0003iZ-ES
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 15:39:05 +0100
Received: by bkbzs2 with SMTP id zs2so7897494bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 06:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=+SCv0Pm2zWJWZz6mWV+8MbxP8iGn6yRWYSvNhqjr9aA=;
	b=QFRTjpgGjc8dpuel3piEFOXYlmEAu1nu2t01vSADcqQ+OTdvNQUETmOnrlmOMcanKW
	lJkUlmabYEXz4cXoqyWkFo2KKgkxhpRlIIe7q7aVwtJ6zesZGGa6S0OQwvFkkaN7SnYs
	OVSVhZ+XHh2EBrVv4LWx5fLLB9FUd/nN0aT2Q=
MIME-Version: 1.0
Received: by 10.204.153.195 with SMTP id l3mr10275156bkw.132.1322490722649;
	Mon, 28 Nov 2011 06:32:02 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.148 with HTTP; Mon, 28 Nov 2011 06:32:02 -0800 (PST)
In-Reply-To: <CAPOJ94MGM=UQY4x+miij+rMcCLXPbJ8M9QHvVQQmf5Loqemc6w@mail.gmail.com>
References: <cover.1322484731.git.otavio@ossystems.com.br>
	<CAPOJ94MGM=UQY4x+miij+rMcCLXPbJ8M9QHvVQQmf5Loqemc6w@mail.gmail.com>
Date: Mon, 28 Nov 2011 12:32:02 -0200
X-Google-Sender-Auth: TmdcCd2Y2xGfFkdU2Cn0YJuQy4E
Message-ID: <CAP9ODKppxv1Kj1qpsXeq9Y6FjmbXBeXL358BZxQuozau3_cEWg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH 0/1] systemd-serialgetty improvement
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
X-List-Received-Date: Mon, 28 Nov 2011 14:39:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 28, 2011 at 11:55, Peter Bigot <bigotp@acm.org> wrote:

> I'm still coming up to speed on OE standard practices, but on other
> Unix-like systems I would expect /sbin/getty to be the standard
> selection, though in some cases a symlink to a preferred alternative.
> Why does the patch make /sbin/getty the last alternative checked,
> instead of the first?
>

If people want, I can change it. No problem.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

