Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 400 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 12 May 2014 10:38:08 UTC
Received: from mail1.bemta7.messagelabs.com (unknown [216.82.254.104])
	by mail.openembedded.org (Postfix) with ESMTP id CE04466014
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 10:38:08 +0000 (UTC)
Received: from [216.82.254.211:30154] by server-8.bemta-7.messagelabs.com id
	60/26-07332-103A0735; Mon, 12 May 2014 10:31:29 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-4.tower-201.messagelabs.com!1399890688!8011468!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.11.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20144 invoked from network); 12 May 2014 10:31:29 -0000
Received: from mail.mx2.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-4.tower-201.messagelabs.com with RC4-SHA encrypted SMTP;
	12 May 2014 10:31:29 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Mon, 12 May 2014 05:31:33 -0500
Received: from dor-sms-exch01.digi.com (10.49.8.100) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 12 May 2014 05:31:26 -0500
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-exch01.digi.com
	(10.49.8.100) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Mon, 12 May 2014 12:31:25 +0200
Message-ID: <5370A2F8.50802@digi.com>
Date: Mon, 12 May 2014 12:31:20 +0200
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, Tom King <ka6sox@gmail.com>, 
	Martin Jansa <martin.jansa@gmail.com>
References: <53612125.8030702@digi.com>	<1474887.TWMWxXuYEb@peggleto-mobl5.ger.corp.intel.com>	<53613AA5.7040903@digi.com>
	<20140430182049.GP2486@jama>
In-Reply-To: <20140430182049.GP2486@jama>
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: Re: [meta-webserver] cherokee webserver SRC_URI broken again
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
X-List-Received-Date: Mon, 12 May 2014 10:38:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Martin,

On 30/04/14 20:20, Martin Jansa wrote:
> Tom, can you please put it on sources.oe.org?
>
> You can find the archive on aruba.

Thanks for looking into this, but did this ever happen?

I'm still having problems with cherokee download. In the fetch log it 
shows trying to get it from 
'http://sources.openembedded.org/cherokee-1.2.98.tar.gz', but still no luck:

$ wget http://sources.openembedded.org/cherokee-1.2.98.tar.gz
--2014-05-12 12:29:11-- 
http://sources.openembedded.org/cherokee-1.2.98.tar.gz
Resolving sources.openembedded.org (sources.openembedded.org)... 
140.211.169.152
Connecting to sources.openembedded.org 
(sources.openembedded.org)|140.211.169.152|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2014-05-12 12:29:11 ERROR 404: Not Found.

-
Javier Viguera
Software Engineer
Digi International® Spain S.A.U.
-- 
Regards,

Javier Viguera

