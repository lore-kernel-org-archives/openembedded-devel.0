Return-Path: <prvs=704bbe891=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 8883B74DF9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2018 19:17:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,258,1526335200"; 
   d="scan'208";a="1515955"
To: Martin Junghans <martin-junghans@freenet.de>,
	<openembedded-devel@lists.openembedded.org>
References: <000601d40a1b$3af95300$b0ebf900$@freenet.de>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <2ff043cb-2706-4e1e-82f7-54c8347769ca@skidata.com>
Date: Fri, 22 Jun 2018 21:16:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <000601d40a1b$3af95300$b0ebf900$@freenet.de>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: yocto layer: meta-java
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
X-List-Received-Date: Fri, 22 Jun 2018 19:17:20 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: de-AT
Content-Transfer-Encoding: 8bit

Hi,
please write problems to the openembedded-devel list so others may help 
you too.

On 06/22/2018 01:21 PM, Martin Junghans wrote:
> Hello,
> 
> I tried to build my own yocto image with the „meta-java“ layer, but it 
> did not work.
> 
> Could you help me to fix the error?

What branches for yocto, meta-oe and meta-java are you using?

> 
> My host system is Ubuntu 16.04 and my device is an ARM IMX6 with YOCTO 
> POKY an I added the following lines to the “local.conf”.
> 
> # Java installation
> 
> IMAGE_INSTALL_append = " openjdk-8 "
> 
> PREFERRED_PROVIDER_virtual/java-initial-native = "cacao-initial-native"
> 
> PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
> 
> PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"

regards;Richard.L

