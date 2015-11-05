Return-Path: <prvs=744399394=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 4B65460125
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 13:49:00 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Av8KAN9dO1asEApK/2dsb2JhbABehA5vBrtphAYdhXUCgXoBAQEBAQGBC0EBCAoBg2EBAQRLASwRCw0LCRYPCQMCAQIBRQYNCAKIL7Z9AYsHAQEBBwIhhlSEfoUnhBIFjRuJLYUdiWCHQRePHoNyhGhxgmYhgRGBBwEBAQ
X-IPAS-Result: Av8KAN9dO1asEApK/2dsb2JhbABehA5vBrtphAYdhXUCgXoBAQEBAQGBC0EBCAoBg2EBAQRLASwRCw0LCRYPCQMCAQIBRQYNCAKIL7Z9AYsHAQEBBwIhhlSEfoUnhBIFjRuJLYUdiWCHQRePHoNyhGhxgmYhgRGBBwEBAQ
Message-ID: <563B5E06.2020600@skidata.com>
Date: Thu, 5 Nov 2015 14:47:50 +0100
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <AE55B37B-BC8F-4516-82BC-B2B1DE341859@gmail.com>
In-Reply-To: <AE55B37B-BC8F-4516-82BC-B2B1DE341859@gmail.com>
X-Originating-IP: [172.16.60.30]
Subject: Re: [meta-java][PATCH] openjdk-8: add recipes for openjdk-8 and openjre-8
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
X-List-Received-Date: Thu, 05 Nov 2015 13:49:03 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Hi,
I have another question regarding your patch ;-)

On 11/03/2015 10:36 AM, Jens Rehsack wrote:
>  recipes-core/openjdk/openjdk-8_72b05.bb            |   36 +
>  recipes-core/openjdk/openjre-8_72b05.bb            |   30 +

In OpenJDK 7 the packages were named openjdk-7-{jre,jdk}, in OpenJDK 8
you name it open{jdk,jre}-8. Shouldn't we stick to one naming scheme?

Or am I missing something?

kind regards,
Richard L

