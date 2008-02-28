Received: from [66.249.82.224] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <xjqian@gmail.com>) id 1JUbx7-0006Bm-5z
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Feb 2008 07:10:57 +0100
Received: by wx-out-0506.google.com with SMTP id h27so3141096wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2008 22:08:24 -0800 (PST)
Received: by 10.70.18.11 with SMTP id 11mr5178965wxr.21.1204178904805;
	Wed, 27 Feb 2008 22:08:24 -0800 (PST)
Received: from ?192.168.1.179? ( [71.16.230.132])
	by mx.google.com with ESMTPS id i10sm5733377wxd.22.2008.02.27.22.08.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 27 Feb 2008 22:08:23 -0800 (PST)
Message-ID: <47C64FD5.4080303@gmail.com>
Date: Thu, 28 Feb 2008 01:08:21 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47C3D204.9090908@dominion.kabel.utwente.nl>
In-Reply-To: <47C3D204.9090908@dominion.kabel.utwente.nl>
X-SA-Exim-Connect-IP: 66.249.82.224
X-SA-Exim-Mail-From: xjqian@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
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
X-List-Received-Date: Thu, 28 Feb 2008 06:11:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/26/2008 03:47 AM, Koen Kooi wrote:
> That's bogus, svn repos must use SRCREV with an entry in
> sane-srcrevs.inc in OE.

fixed SRCREV for ffmpeg_svn and netsurf_svn

Gordon


