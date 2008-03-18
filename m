Received: from [64.233.166.180] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1JbYXb-0008CR-UJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Mar 2008 10:55:33 +0100
Received: by py-out-1112.google.com with SMTP id y77so5695068pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2008 02:55:31 -0700 (PDT)
Received: by 10.65.240.17 with SMTP id s17mr2911450qbr.53.1205834130995;
	Tue, 18 Mar 2008 02:55:30 -0700 (PDT)
Received: from ?192.168.1.204? ( [24.107.189.117])
	by mx.google.com with ESMTPS id a29sm20933020qbd.4.2008.03.18.02.55.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 18 Mar 2008 02:55:30 -0700 (PDT)
Message-ID: <47DF918E.6070907@gmail.com>
Date: Tue, 18 Mar 2008 04:55:26 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>
In-Reply-To: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>
X-SA-Exim-Connect-IP: 64.233.166.180
X-SA-Exim-Mail-From: xjqian@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] move to opkg
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
X-List-Received-Date: Tue, 18 Mar 2008 09:55:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/18/2008 03:55 AM, Koen Kooi wrote:
> Hi,
> 
> Poky just switched to opkg and removed ipkg completely, which I think is 
> a good thing, but here's a less drastic patch for OE.
> 
> Executive summary: you still get .ipk packages, just as before, only 
> your rootfs ends up with opkg.  Things like sharprom-compat and 
> wrt54g-oe will continue to work just as before.
> 
> I'd like to apply this ASAP if there are no serious complaints.

I don't see any reason why not. Go ahead...

Regards
Gordon


