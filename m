Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QqjQ8-0000sk-78
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Aug 2011 12:20:24 +0200
Received: by eyb7 with SMTP id 7so3899580eyb.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2011 03:15:52 -0700 (PDT)
Received: by 10.213.2.209 with SMTP id 17mr484735ebk.5.1312884952106;
	Tue, 09 Aug 2011 03:15:52 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id x4sm2942439eef.21.2011.08.09.03.15.50
	(version=SSLv3 cipher=OTHER); Tue, 09 Aug 2011 03:15:50 -0700 (PDT)
Message-ID: <4E4108D5.5040303@dresearch-fe.de>
Date: Tue, 09 Aug 2011 12:15:49 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E3A3C4B.8040208@dresearch-fe.de>
	<4E3B9812.9010002@dresearch-fe.de>
	<4E3ECD6E.7000201@dresearch-fe.de>
	<CA+M6bXkrQyqiSFFxsyZv4mRPUmk82EbdUzSygrBaoyp5zeQ9zA@mail.gmail.com>
	<4E40FCA9.7060204@dresearch-fe.de>
In-Reply-To: <4E40FCA9.7060204@dresearch-fe.de>
X-Enigmail-Version: 1.2
Subject: Re: [2011.03-maintenance] unsatisfied dependencies to libgcc
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
X-List-Received-Date: Tue, 09 Aug 2011 10:20:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.08.2011 11:23, Steffen Sledz wrote:
> The do_package_write_ipk generates ipk-file with *r24.1.6* (which is the PR of gcc) and not *r24.2.6* (which is the PR of gcc).

Sorry, little typo. Should be:

The do_package_write_ipk generates ipk-file with *r24.1.6* (which is the PR of gcc) and not *r24.2.6* (which is the PR of gcc-cross).


