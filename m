Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1GrEX7-0005RS-DW
	for openembedded-devel@openembedded.org; Mon, 04 Dec 2006 15:11:01 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1GrEWE-0000sU-Lh
	for openembedded-devel@openembedded.org; Mon, 04 Dec 2006 15:10:06 +0100
Received: from r77f8.r.ppp-pool.de ([89.54.119.248])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 04 Dec 2006 15:10:06 +0100
Received: from no2spam by r77f8.r.ppp-pool.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 04 Dec 2006 15:10:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Mon, 04 Dec 2006 15:09:50 +0100
Message-ID: <el1a7i$707$1@sea.gmane.org>
References: <b9481e140612030440q4cd679e2l9c5ae7b3f2e7f423@mail.gmail.com>
	<299907395.20061204142534@vanille-media.de>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: r77f8.r.ppp-pool.de
User-Agent: Thunderbird 1.5.0.8 (X11/20061117)
In-Reply-To: <299907395.20061204142534@vanille-media.de>
Sender: news <news@sea.gmane.org>
Subject: Re: libqte-sharprom in OE (attn Mickey)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Dec 2006 14:11:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Michael 'Mickey' Lauer wrote:

> Something like that -- see how we are doing it with the sharprom
> binary-only camera drivers. Basically you need to upload the libraries
> and include files to some site and make a .bb file download them and
> copy them into staging.

Nicolas,

could you write up some summary of what problems one can encounter 
compiling for Sharp ROM and how to deal with them and put that up in the 
wiki so everyone benefits and can improve the info?  I am still 
struggling with getting the app to compile all the way through, so I 
cannot comment yet on running the thing.

Regards

Rolf



