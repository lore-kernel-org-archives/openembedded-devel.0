Received: from [66.249.82.225] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <xjqian@gmail.com>) id 1JUbty-00067p-9z
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Feb 2008 07:06:24 +0100
Received: by wx-out-0506.google.com with SMTP id h27so3139989wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2008 22:05:09 -0800 (PST)
Received: by 10.70.53.1 with SMTP id b1mr5172491wxa.80.1204178709037;
	Wed, 27 Feb 2008 22:05:09 -0800 (PST)
Received: from ?192.168.1.179? ( [71.16.230.132])
	by mx.google.com with ESMTPS id h10sm12676242wxd.32.2008.02.27.22.05.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 27 Feb 2008 22:05:08 -0800 (PST)
Message-ID: <47C64F11.2050401@gmail.com>
Date: Thu, 28 Feb 2008 01:05:05 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47C3D204.9090908@dominion.kabel.utwente.nl>
In-Reply-To: <47C3D204.9090908@dominion.kabel.utwente.nl>
X-SA-Exim-Connect-IP: 66.249.82.225
X-SA-Exim-Mail-From: xjqian@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: commit 9b9a2409c7e2ddb2caf0a5aba74549f65c52b503
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
X-List-Received-Date: Thu, 28 Feb 2008 06:07:19 -0000
X-List-Received-Date: Thu, 28 Feb 2008 06:07:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/26/2008 03:47 AM, Koen Kooi wrote:
> That's bogus, svn repos must use SRCREV with an entry in
> sane-srcrevs.inc in OE.

fixed SRCREV for ffmpeg_svn and netsurf_svn

Gordon


