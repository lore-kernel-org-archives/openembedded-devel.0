Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.207])
	by mail.openembedded.org (Postfix) with ESMTP id 1D9466D42C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2013 16:43:39 +0000 (UTC)
Received: from [216.82.241.132:33025] by server-15.bemta-8.messagelabs.com id
	19/7F-29288-C33CB725; Thu, 07 Nov 2013 16:43:40 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-14.tower-45.messagelabs.com!1383842620!28601090!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.9.13; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15174 invoked from network); 7 Nov 2013 16:43:40 -0000
Received: from mail.mx2.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-14.tower-45.messagelabs.com with RC4-SHA encrypted SMTP;
	7 Nov 2013 16:43:40 -0000
Received: from mcl-sms-exch01.digi.com (10.5.8.50) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.327.1;
	Thu, 7 Nov 2013 10:43:41 -0600
Received: from dor-sms-exch01.digi.com (10.49.8.100) by
	mcl-sms-exch01.digi.com (10.5.8.50) with Microsoft SMTP Server (TLS) id
	8.3.327.1; Thu, 7 Nov 2013 10:43:39 -0600
Received: from [10.101.1.79] (10.101.1.79) by dor-sms-exch01.digi.com
	(10.49.8.100) with Microsoft SMTP Server (TLS) id 8.3.327.1;
	Thu, 7 Nov 2013 17:43:37 +0100
Message-ID: <527BC338.4020400@digi.com>
Date: Thu, 7 Nov 2013 17:43:36 +0100
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
References: <1383842156-13651-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1383842156-13651-1-git-send-email-eric@eukrea.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] cherokee: use cherokee-project.de mirror
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
X-List-Received-Date: Thu, 07 Nov 2013 16:43:39 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 07/11/13 17:35, Eric Bénard wrote:
> -SRC_URI = "ftp://ftp.osuosl.org/.1/cherokee/1.2/${PV}/cherokee-${PV}.tar.gz \
> +SRC_URI = "http://www.cherokee-project.de/mirrors/cherokee/1.2/1.2/${PV}/cherokee-${PV}.tar.gz \

I'm afraid patch *v2* has the same problem, extra 1.2 in the URL :-)

-
Javier Viguera
Software Engineer
Digi International® Spain S.A.U.

