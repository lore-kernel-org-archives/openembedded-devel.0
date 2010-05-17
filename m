Received: from mail-qy0-f172.google.com ([209.85.221.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OE64B-0000Hk-Ac
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 21:33:32 +0200
Received: by qyk2 with SMTP id 2so7217650qyk.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 12:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=0oXFE7Xwy/y3gus6vggcwLrHYvG2F9Du4twblOBJu5M=;
	b=vw+jA+CV7Ljp/YK3gZdmHj06qqYy9xz7zBS0psCo5E2RcaeyMhcEehrwFuidULUjdb
	gIFND9RLM9/YmVjoi4xZCnsN0/xZsLq0EGLt2o0FXAAVC/jj/3/adyvhvyWbQPtTTWgC
	bkMdNPfijPA4IkF4rFdhA6bIpROo0zhT0HvcQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=JnU5e8Iw9rkIts6mcyqfl2VrsCZCVAQy6Xwc+ibc5+WMmnCDPrdzhzrBX2wzy4Am6K
	Bh6+oRQ19K4hKvY4gX9rFJ4Vq/NlMIjAxyIVtkL/UEpe2peNndETEPIKRx3vr9VHwZLk
	dr3gfW10uoymtUJaYLSs8Z7pwJT0wgkANCeE4=
MIME-Version: 1.0
Received: by 10.229.251.79 with SMTP id mr15mr1243375qcb.37.1274124571377; 
	Mon, 17 May 2010 12:29:31 -0700 (PDT)
Received: by 10.229.230.77 with HTTP; Mon, 17 May 2010 12:29:31 -0700 (PDT)
In-Reply-To: <20100517191837.GB7932@gmail.com>
References: <AANLkTinM-N-vAT4yP0ptz0UcMBNsLHpQZ1er2VwnsDDv@mail.gmail.com>
	<20100517190152.GB7868@gmail.com>
	<AANLkTinsmKk2J576bTB0-Wkk48G5He9koqeQiU4MHhL_@mail.gmail.com>
	<20100517191837.GB7932@gmail.com>
Date: Mon, 17 May 2010 14:29:31 -0500
Message-ID: <AANLkTikLN9HgYy5Q6ICrDYuOBB47JdPy8vZiaf-Hv5uu@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.172
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Microblaze gcc 4.5.0 support
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
X-List-Received-Date: Mon, 17 May 2010 19:33:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

config.log http://pastebin.com/HjkNWXJP

On Mon, May 17, 2010 at 2:18 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On (17/05/10 14:14), Adrian Alonso wrote:
> > Hi Khem,
> >
> > log.do_configure at http://pastebin.com/AjAtfnpu
> > log.do_compile at http://pastebin.com/bqAmHvuu
>
> post config.log from inside the gcc build tree.
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

