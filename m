Return-Path: <hugo.saldanha@aker.com.br>
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id 7926C73C86
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 13:48:28 +0000 (UTC)
Received: from mail.aker.com.br (bat.bsb.aker.com.br [10.0.0.20])
	by asmg.aker.com.br [10.0.1.3]; Tue, 31 Mar 2015 10:48:09 -0300
	(envelope-from hugo.saldanha@aker.com.br)
Received: from localhost (10.4.3.1) by mail.aker.com.br (10.0.0.20) with
	Microsoft SMTP Server (TLS) id 8.3.342.0;
	Tue, 31 Mar 2015 10:48:20 -0300
Date: Tue, 31 Mar 2015 10:51:13 -0300
From: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20150331135113.GB5096@saldanha.aker.com.br>
References: <1427742371-19160-1-git-send-email-hugo.saldanha@aker.com.br>
	<CAP9ODKpr0mxqDF3+ORP5Ee3=qr3rMhXgTGWyD4BPU-jgEcOJ3A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpr0mxqDF3+ORP5Ee3=qr3rMhXgTGWyD4BPU-jgEcOJ3A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-AkerSMTPGW-ServerID: d3ca878c259c98dab9711b092908c214d1fd543e
X-AkerSMTPGW-MessageID: b8ae918f9bedb2ed474e944fe18cb18f3e4f80e7-10o
Subject: Re: [meta-java][PATCH] cacao: fix problem with internal garbage collector
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Mar 2015 13:48:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Otavio,

On Mon, Mar 30, 2015 at 09:46:24PM -0300, Otavio Salvador wrote:
> On Mon, Mar 30, 2015 at 4:06 PM, Hugo Vasconcelos Saldanha
> <hugo.saldanha@aker.com.br> wrote:
> > Cacao uses an internal version of bdwgc that was being installed
> > (headers, libs, etc.) together with the JVM, unnecessarily conflicting
> > with original bwdgc package.
> >
> > A patch from Gentoo is applied so the system's bdwgc is used instead.
> >
> > Signed-off-by: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
> 
> Please add a patch description, signed-off-by and also Upstream-Status header.
> 

Sure.

-- 
		Hugo


