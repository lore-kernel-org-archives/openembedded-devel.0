Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id D88FE6D899
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Mar 2014 11:52:16 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E9516223202F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Mar 2014 12:52:14 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 5662E223202E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Mar 2014 12:52:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Mar 2014 12:52:14 +0100 (CET)
Date: Wed, 19 Mar 2014 12:52:09 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140319115209.GF12765@mail.itconsulting-heinold.de>
References: <4F8CA425FC34A24C8608E3D85A89B1BD3B8C8144@EPBYMINSA0032.epam.com>
MIME-Version: 1.0
In-Reply-To: <4F8CA425FC34A24C8608E3D85A89B1BD3B8C8144@EPBYMINSA0032.epam.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: meta-java: using maven build tool
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
X-List-Received-Date: Wed, 19 Mar 2014 11:52:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 19, 2014 at 10:09:56AM +0000, Vladimir Redzhepov wrote:
> Hello,
> 
> I'd like to create a BSP for my device using meta-java layer. The main application is written in Java and uses Apache Maven
> project management tool. I looked fixedly at meta-java and didn't find this tool. Can you tell me how to make a right build
> of my application based on Apache Maven within meta-java? Is it good just to download binary package for maven and
> unpack it into the staging directory?
> 
> Best Regards,
> Vladimir Redzhepov

Hi,

that is your only chance for now. I did not find time to integrate maven, graddle or ivy yet, because it is time consuming.


Bye Henning

