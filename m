Return-Path: <heinold@inf.fu-berlin.de>
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
	[130.133.4.66])
	by mail.openembedded.org (Postfix) with ESMTP id CD0466101C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2013 19:30:57 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
	by outpost1.zedat.fu-berlin.de (Exim 4.80.1) with esmtp
	(envelope-from <heinold@inf.fu-berlin.de>)
	id <1VQjBL-001Bsw-Cz>; Mon, 30 Sep 2013 21:30:59 +0200
Received: from f052067244.adsl.alicedsl.de ([78.52.67.244]
	helo=mail.zedat.fu-berlin.de)
	by inpost2.zedat.fu-berlin.de (Exim 4.80.1) with esmtpsa
	(envelope-from <heinold@inf.fu-berlin.de>)
	id <1VQjBL-001xz1-7X>; Mon, 30 Sep 2013 21:30:59 +0200
Date: Mon, 30 Sep 2013 21:30:48 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130930193046.GB22970@mail.zedat.fu-berlin.de>
References: <1380548771-13812-1-git-send-email-riku.voipio@linaro.org>
	<1380548771-13812-3-git-send-email-riku.voipio@linaro.org>
	<20130930155838.08e5f9d4@e6520eb>
MIME-Version: 1.0
In-Reply-To: <20130930155838.08e5f9d4@e6520eb>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: 78.52.67.244
Cc: patches@linaro.org
Subject: Re: [meta-java][PATCH 3/3] jamvm/java: allow spaces in arguments
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
X-List-Received-Date: Mon, 30 Sep 2013 19:30:58 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Sep 30, 2013 at 03:58:38PM +0200, Eric Bénard wrote:
> Hi Riku,
> 
> Le Mon, 30 Sep 2013 16:46:11 +0300,
> Riku Voipio <riku.voipio@linaro.org> a écrit :
> 
> > Current IFS mangling blows up on the face:
> > 
> >     | configure:2341: javac  -classpath .: Test.java
> >     | Invalid maximum heap size: -Xmx1024m-cp/srv/oe/b
> > 

Which shell blows it up? With dash on ubuntu its working fine.

Bye Henning

