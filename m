Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 241F96AD31
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Jul 2013 20:10:33 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id ta17so4100977obb.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Jul 2013 13:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=7dKPG00XlA8XPTMpbof0HRag8ecGMKUl6lpXTwHMuBo=;
	b=U6yB223KT4pULGnpcqVcWFrgjQCp9GaxlRr8rFK278xLEsWoSUdY0MB0fLIVetYHTS
	DOW9XKmHt8SU92f0X3Dw0c4wf/TDg5ghsgSonXZdcEITA2eM1iUQ/Cui4tguhT+E1e9d
	KI3PgpL2zThtmW11CZ7FdDNYGFrJ4BEjsaDwgXzVjCYdPIDsbCt+Y/XQ8BGxJDq2Cu+O
	NcnGPme59wVtsRvuvvS2qpLxQKYW7ViXvMZlo0t/zAwsbCkCKDrS+lkwHZQZxB34R+vb
	oDbqYQEhxxHsBb1SKxxpBtXGcEXqpz6GXZS61wca8VtnRZucTMtS5J04NE75LNBBnpCn
	EMXQ==
MIME-Version: 1.0
X-Received: by 10.182.142.104 with SMTP id rv8mr11049606obb.3.1373141433533;
	Sat, 06 Jul 2013 13:10:33 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.60.166 with HTTP; Sat, 6 Jul 2013 13:10:33 -0700 (PDT)
In-Reply-To: <1373078818-18530-1-git-send-email-net147@gmail.com>
References: <1373078818-18530-1-git-send-email-net147@gmail.com>
Date: Sat, 6 Jul 2013 17:10:33 -0300
X-Google-Sender-Auth: aiKEI7RvYosZYKo03M9nNnPG4iM
Message-ID: <CAP9ODKo+jxNqd8K4YqRR78YAKrX3bsibt0_npynHL-g3GO935g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] qt-creator: add new recipe for version 2.7.2
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
X-List-Received-Date: Sat, 06 Jul 2013 20:10:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 5, 2013 at 11:46 PM, Jonathan Liu <net147@gmail.com> wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>

This recipe seems to be usable in target but it'd be great if Qt
Creator could also be build as a toolchain part; did you try it?

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

