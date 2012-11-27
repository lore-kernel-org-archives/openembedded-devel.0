Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TdL6h-0000Gq-BO
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 14:21:47 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so6506232pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 05:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=bS8l5WErwDoKrR9SUxXRw8BzkFgeDKoSUMHgsdD+2Cw=;
	b=qUxkupmdZcgZdTgB3o9fdYeN74paGgFPzRK+sC6AM95pbPtkNhANTvrlburKRPYSNG
	wTsjV5umK4l/AsLQGePYEiB3lsAABEhIsHl+hBz95lsFhOjr6F0Hd0m6emAebEd8IRU3
	ZmBflINvzGbBU0KgmZqYJG/lREY6pqkS8+BlUwrcpntF03LeJHMbv9mUlN4SbZdzePI2
	9uA09bjYnxFePLKMiifzPAFl0aawkMub/1UgvloAtegDrVkNH6LI55ZD19T0DKkxNg64
	CkI+VhQQmTST7hwV6A6sLho/tEbnKE4UzHqYyRSf7FtSEytz5tPm9suUmGIg/z++dYf7
	6BTw==
MIME-Version: 1.0
Received: by 10.68.204.103 with SMTP id kx7mr48386419pbc.33.1354021653435;
	Tue, 27 Nov 2012 05:07:33 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Tue, 27 Nov 2012 05:07:33 -0800 (PST)
In-Reply-To: <cover.1354018185.git.paul.eggleton@linux.intel.com>
References: <cover.1354018185.git.paul.eggleton@linux.intel.com>
Date: Tue, 27 Nov 2012 11:07:33 -0200
X-Google-Sender-Auth: IusNXLxi7u3MgUBYqycz8parDrM
Message-ID: <CAP9ODKopCC_TE7XFYX-rO8A-4F8ALV09-pJvD6WvbK2gSTPzAA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 0/4] Remove recipes in other layers
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
X-List-Received-Date: Tue, 27 Nov 2012 13:21:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 27, 2012 at 10:11 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Remove some recipes now maintained in other layers. This is just the
> low-hanging fruit, there are others that will need a closer look.
...

Nice! I love cleanup patches ;-)

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


