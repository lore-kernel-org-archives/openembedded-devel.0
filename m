Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 7C2396E894
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2014 10:38:22 +0000 (UTC)
Received: from [10.1.14.248] (83-64-248-68.inzersdorf.xdsl-line.inode.at
	[83.64.248.68]) by ptmx.org (Postfix) with ESMTPSA id CCC14225F1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2014 11:38:22 +0100 (CET)
Message-ID: <52FCA09E.1070507@pseudoterminal.org>
Date: Thu, 13 Feb 2014 11:38:22 +0100
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: OE and SSDs
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
X-List-Received-Date: Thu, 13 Feb 2014 10:38:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

we are considering purchasing SSDs for our development machines, for 
faster I/O and better latency. One open question is whether to buy TLC- 
or MLC-based drives. TLCs are considerably cheaper. They would not be 
used in build bots, but on the other hand, people will build entire 
images with OE by themselves during development.

So I wonder about the impact on the drive's lifespan, and whether or not 
it is severe enough to warrant the more expensive MLC drives (up to 2 
times more expensive).

Did anybody made experiences with these? Any recommendations?

