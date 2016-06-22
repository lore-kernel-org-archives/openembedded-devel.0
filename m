Return-Path: <frederico.cadete@awtce.be>
Received: from barracuda.aweurope.be (barracuda.aweurope.be [212.166.56.147])
	by mail.openembedded.org (Postfix) with ESMTP id 2BD6173178
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 15:27:37 +0000 (UTC)
X-ASG-Debug-ID: 1466609255-0a6d4a62ba7b33e0001-aWHRdb
Received: from awe-nav5 ([172.23.1.67]) by barracuda.aweurope.be with ESMTP id
	loLDwyyjlrlOaNEP (version=TLSv1.2 cipher=DHE-RSA-AES128-SHA
	bits=128 verify=NO) for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 17:27:37 +0200 (CEST)
X-Barracuda-Envelope-From: frederico.cadete@awtce.be
X-Barracuda-RBL-Trusted-Forwarder: 172.23.1.67
X-ASG-Whitelist: Client
Date: Wed, 22 Jun 2016 17:27:35 +0200
From: Frederico Cadete <frederico.cadete@awtce.be>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160622152735.GA10344@awe-nav5>
X-ASG-Orig-Subj: Re: [oe] [meta-oe][PATCH v2] gtest: fix installation in
	multilib
References: <CAP9ODKqwQEaf-8BH-CeWrv6h=kdXe0gEcm+YMzqbNec4REeGJg@mail.gmail.com>
	<1466604652-18822-1-git-send-email-frederico.cadete@awtce.be>
	<20160622141632.GA18936@awe-nav5>
	<CAP9ODKp+yf=R+b+gtVVRgKQt8RA85gViQU6bAs1-xhZh2=QKEw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKp+yf=R+b+gtVVRgKQt8RA85gViQU6bAs1-xhZh2=QKEw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Barracuda-Connect: UNKNOWN[172.23.1.67]
X-Barracuda-Start-Time: 1466609255
X-Barracuda-Encrypted: DHE-RSA-AES128-SHA
X-Barracuda-URL: https://172.23.0.236:443/cgi-mod/mark.cgi
X-Barracuda-Scan-Msg-Size: 924
X-Virus-Scanned: by bsmtpd at aweurope.be
X-Barracuda-BRTS-Status: 1
Subject: Re: [meta-oe][PATCH v2] gtest: fix installation in multilib
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jun 2016 15:27:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 22, 2016 at 11:20:00AM -0300, Otavio Salvador wrote:
> On Wed, Jun 22, 2016 at 11:16 AM, Frederico Cadete
> <frederico.cadete@awtce.be> wrote:
> > There it is, now with signed-off.
> > It could also be useful to backport onto jethro and krogoth.
> > It applies cleanly there.
> 
> Agreed however the request must be made after it is merged into master.

That's a very good policy because in fact my patch has a bug
(mismatch between patch filename and SRC_URI).

I'll send a v3...

> 
> 
> -- 
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

