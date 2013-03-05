Received: from mail-vc0-f181.google.com ([209.85.220.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UD0wx-0006Gl-6V
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Mar 2013 00:07:12 +0100
Received: by mail-vc0-f181.google.com with SMTP id f13so4500365vcb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2013 14:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=6ECyptkew60qT5sw17O9rjO//O1euYPDlf8RqsVKB6M=;
	b=Qg6HhWDB8jL2jgFIVhM5UogdXZ8HaFl5WcHOncOHPwaYnFeGn/ZBb3fGVqNCFUXBe9
	Q33DldizKLlJtnIy0E63J8fLOHZ+FL/9bMkIrYbvjd5tsj8ZhuqKlPEf43KMlfItt8P6
	1LemHfgSrZY+XNwMiHE8Chr3ofhQjKDRSVHgfLevRPtZEZLwmTujXe1GA0q1dmItV1F9
	u6Yy2ajEzj7QJn9NrWPvPVXCGWeKk7UXX1+E47m8Zlx69TVuLipoAMHg5e5huZzPzcsm
	4ul7FP6U9r2MqWTBah14gaDaVuknR059xpwjiakVD33PKFOnHls6NmZrIzAMGyb+OlCX
	XMjg==
MIME-Version: 1.0
X-Received: by 10.52.65.147 with SMTP id x19mr9091272vds.27.1362523841090;
	Tue, 05 Mar 2013 14:50:41 -0800 (PST)
Received: by 10.52.185.168 with HTTP; Tue, 5 Mar 2013 14:50:41 -0800 (PST)
In-Reply-To: <20130305221857.GA14869@jama>
References: <1360776335-21633-1-git-send-email-raj.khem@gmail.com>
	<20130305221857.GA14869@jama>
Date: Tue, 5 Mar 2013 23:50:41 +0100
Message-ID: <CALbNGRRZFt3FgMCjyB8JN8Be1w_-Vdgnq=2nZy3tyUM0TxdFpA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd][PATCH 1/2] Delete systemd class.
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
X-List-Received-Date: Tue, 05 Mar 2013 23:07:13 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 5, 2013 at 11:18 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Feb 13, 2013 at 09:25:34AM -0800, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> good old meta-systemd should now parse again,
Thanks - will come back to test HEADs soon.

> I wont apply this 2 commits
> until systemd discussion in oe-core is finished and future of
> meta-systemd decided.
>
After systemd regression is worked around yocto 1.4 release regression
is knocking at the door...

Andreas


