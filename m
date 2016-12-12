Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id D5AB770101
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2016 08:30:24 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id BCBEFD40392
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2016 09:30:23 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 07B46D4025E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2016 09:30:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de (unknown [178.19.210.209])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2016 09:30:22 +0100 (CET)
Date: Mon, 12 Dec 2016 09:30:14 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161212083013.GA9402@mail.itconsulting-heinold.de>
References: <CAH4+OFpuPOdJsiEGXO=QX58qq_y_85c5SFHQZ2WM7VE0wo+HXw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH4+OFpuPOdJsiEGXO=QX58qq_y_85c5SFHQZ2WM7VE0wo+HXw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: OpenJDK-8-jre: javadoc: error - java.lang.OutOfMemoryError
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Dec 2016 08:30:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 08, 2016 at 04:55:19PM +0530, Srinivasa Rao Ragolu wrote:
> Hi All,
> 
> I am trying to build openjdk-8-jre for arm using yocto meta-java layer. I
> have been facing do_compile error for openjdk-8-jre as shown below.
> 
> Can somebody help me to resolve this issue...
> 
> *| javadoc: error - java.lang.OutOfMemoryError: Please increase memory.*
> *| For example, on the JDK Classic or HotSpot VMs, add the option -J-Xmx*
> *| such as -J-Xmx32m.*
> *| 1 error*
> 
> 
> Please help me in resolving this issue .
> 
> THanks,
> Srinivas.

Hi,

try to use a computer with more RAM.

Bye Henning

