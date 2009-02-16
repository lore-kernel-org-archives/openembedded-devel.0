Received: from [65.254.253.34] (helo=mailout04.yourhostingaccount.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <SRS0=YPNeK/=6T=ngndg.com=tim@yourhostingaccount.com>)
	id 1LZ9Hu-0001jT-Sk for openembedded-devel@lists.openembedded.org;
	Mon, 16 Feb 2009 20:37:55 +0100
Received: from mailscan19.yourhostingaccount.com ([10.1.15.19]
	helo=mailscan19.yourhostingaccount.com)
	by mailout04.yourhostingaccount.com with esmtp (Exim)
	id 1LZ9G4-0007DQ-W8 for openembedded-devel@lists.openembedded.org;
	Mon, 16 Feb 2009 14:36:01 -0500
Received: from impout03.yourhostingaccount.com ([10.1.55.3]
	helo=impout03.yourhostingaccount.com)
	by mailscan19.yourhostingaccount.com with esmtp (Exim)
	id 1LZ9G4-00051k-BO for openembedded-devel@lists.openembedded.org;
	Mon, 16 Feb 2009 14:36:00 -0500
Received: from authsmtp08.yourhostingaccount.com ([10.1.18.8])
	by impout03.yourhostingaccount.com with NO UCE
	id Gjbz1b0080ASqTN0000000; Mon, 16 Feb 2009 14:35:59 -0500
X-EN-OrigOutIP: 10.1.18.8
X-EN-IMPSID: Gjbz1b0080ASqTN0000000
Received: from 92-237-114-21.cable.ubr03.chms.blueyonder.co.uk
	([92.237.114.21] helo=[192.168.1.106])
	by authsmtp08.yourhostingaccount.com with esmtpa (Exim)
	id 1LZ9G3-0004Cd-9E for openembedded-devel@lists.openembedded.org;
	Mon, 16 Feb 2009 14:35:59 -0500
Message-Id: <C3C7F026-8C3F-4247-8370-78C109729166@ngndg.com>
From: Tim Ellis <tim@ngndg.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4995CF5B.6080103@balister.org>
Mime-Version: 1.0 (Apple Message framework v930.3)
Date: Mon, 16 Feb 2009 19:35:55 +0000
References: <4995BFE1.7090900@dls.net> <4995CF5B.6080103@balister.org>
X-Mailer: Apple Mail (2.930.3)
X-EN-UserInfo: b8ae887d91300d60195f6ea73d56f3bc:43527cee0c82d0ab5dc2dc3726f6afdf
X-EN-AuthUser: tim@ngndg.com
Sender: Tim Ellis <tim@ngndg.com>
X-EN-OrigIP: 92.237.114.21
X-EN-OrigHost: 92-237-114-21.cable.ubr03.chms.blueyonder.co.uk
Subject: Re: boost-1.36.0 fails when compiling; cannot find the compiler
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
X-List-Received-Date: Mon, 16 Feb 2009 19:37:56 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit

Currently not working on ARM:

http://tinderbox.openembedded.net/public/logs/3460249.txt

On 13 Feb 2009, at 19:51, Philip Balister wrote:

> It's been working on arm. And yes, the boost build system sucks :(



