Return-Path: <hugo.saldanha@aker.com.br>
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id 1D26C75A06
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 18:22:00 +0000 (UTC)
Received: from mail.aker.com.br (bat.bsb.aker.com.br [10.0.0.20])
	by asmg.aker.com.br [10.0.1.3]; Thu, 25 Jun 2015 15:21:54 -0300
	(envelope-from hugo.saldanha@aker.com.br)
Received: from localhost (10.4.3.1) by mail.aker.com.br (10.0.0.20) with
	Microsoft SMTP Server (TLS) id 8.3.342.0;
	Thu, 25 Jun 2015 15:21:59 -0300
Date: Thu, 25 Jun 2015 15:26:17 -0300
From: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20150625182617.GM1706@saldanha.aker.com.br>
References: <1435075324-12895-1-git-send-email-hugo.saldanha@aker.com.br>
	<20150625144827.GD2394@jama>
MIME-Version: 1.0
In-Reply-To: <20150625144827.GD2394@jama>
User-Agent: Mutt/1.5.23+89 (0255b37be491) (2014-03-12)
X-AkerSMTPGW-ServerID: efa1de5243ffebe9bf836ee14063171c1764dbbe
X-AkerSMTPGW-MessageID: 89f1ae7cda9c52aa86a88c717d7e1c6be5275620-10o
Subject: Re: [meta-oe][master/fido/dizzy][PATCH] libssh2: upgrade to v1.6.0
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
X-List-Received-Date: Thu, 25 Jun 2015 18:22:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jun 25, 2015 at 11:48:27AM -0300, Martin Jansa wrote:
> On Tue, Jun 23, 2015 at 01:02:04PM -0300, Hugo Vasconcelos Saldanha wrote:
> > Besides new features and improvements, this fixes CVE-2015-1782.
> 
> Release branches aren't getting new features, new versions unless there
> is very good reason to do so.
> 
> I'll include this in master-next, but for release branches you should
> just add patch for CVE-2015-1782 without the upgrade. (release
> maintainers call)
> 

No problem. I'll send another patch for fido/dizzy with the fix applied
to debian.

-- 
		Hugo


