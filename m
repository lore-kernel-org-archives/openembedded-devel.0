Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JvSM6-00020P-Uw
	for openembedded-devel@openembedded.org; Mon, 12 May 2008 09:21:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m4C7KfRk003046
	for <openembedded-devel@openembedded.org>;
	Mon, 12 May 2008 08:20:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02924-02 for <openembedded-devel@openembedded.org>;
	Mon, 12 May 2008 08:20:26 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m4C7JLoa002945
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 12 May 2008 08:19:22 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0805111546g62514fd0r484f57471997c958@mail.gmail.com>
References: <g049dg$2ks$1@ger.gmane.org>
	<c384c5ea0805100820t64c75e41qde797bfb3245b7ed@mail.gmail.com>
	<g04ftr$krb$1@ger.gmane.org>
	<c384c5ea0805111546g62514fd0r484f57471997c958@mail.gmail.com>
Date: Mon, 12 May 2008 08:19:21 +0100
Message-Id: <1210576761.4981.1.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: reverse the name change for org.oe.stable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Mon, 12 May 2008 07:21:57 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2008-05-12 at 00:46 +0200, Leon Woestenberg wrote:
> Yes, do not use _<scm> recipes in stable stuff, a known checkout of
> the OE stable branch should either build or not for a particular
> machine/distro/... combo.
> 
> If I checkout today's stable tree in one year time, it should build. Period.
> 
> That isn't going to work with _<scm> recipes being active in stable.

Floating SCM versions won't be reproducible, fixed SCM versions will. If
SCM versions are used they need to be locked to a version.

Cheers,

Richard





