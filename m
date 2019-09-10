Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 831 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 10 Sep 2019 12:54:10 UTC
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
	[67.219.246.5])
	by mail.openembedded.org (Postfix) with ESMTP id 095567E63A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 12:54:10 +0000 (UTC)
Received: from [67.219.246.101] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.us-east-1.aws.symcld.net id 39/22-07443-4B9977D5;
	Tue, 10 Sep 2019 12:40:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPIsWRWlGSWpSXmKPExsXi5LtOQHfzzPJ
	Yg3OTzS32flrEaHHx8FJmByaPnbPusnuc27iCMYApijUzLym/IoE149nBl2wFsRXLPz9gbGD0
	6mLk4hASWM0o8XbFHHYIZw2jxNVbPYwQzmJGiQ1f+5i6GDk5hAUsJZ5+ns0CYosIhEo8+PyTD
	cQWEmgHaj9eDmKzCehJTL70hBnE5hWwlrizrh3MZhFQlXh+YzcjiC0qEC7x4skZNogaQYmTM5
	+AzeQUiJY4cewqWA2zgIXEzPnnoWxxiVtP5jNB2PIS29/OYYbYqyJxcOllsBoJoPimzWfZJzA
	KzkIydhaSUbOQjJqFZNQCRpZVjGZJRZnpGSW5iZk5uoYGBrqGhka6hrqGZpZ6iVW6SXqlxbqp
	icUluoZ6ieXFesWVuck5KXp5qSWbGIHhn1LAuHIH49+Zb/QOMUpyMCmJ8uYZl8cK8SXlp1RmJ
	BZnxBeV5qQWH2KU4eBQkuDdMh0oJ1iUmp5akZaZA4xFmLQEB4+SCO/uGUBp3uKCxNzizHSI1C
	lGS457T+YuYuZYsHUJkNy14MliZiGWvPy8VClxXk9gxAsJgDRklObBjYOli0uMslLCvIwMDAx
	CPAWpRbmZJajyrxjFORiVhHkfgazlycwrgdv6CuggJqCDfCtKQQ4qSURISTUwFX41em2dIZKj
	fZXrtcnFVOt246PbPEWPaRifEqrQ+K2/7+ep4+dePNLQr592ZdZRCx6DrEb3FY9V5Vj0Sk4+e
	7/j4fKA5DCHyHfPb3/pezLbN0izSn2XCo/hgfT4sN8LJ8UrTp6h2v/c7MwRB/9z74oOdm9ocb
	ok1bdzkriph/v2mToSSdtqLkdXt87bLCwhxPuzpDDN4M2kr7J78rcvN24wLl7x789du+bZU1L
	3t30QMvd4yLQ9qJm5br73i4sljOrZ/oVi3JGhUdo8KV/lJz1f26hSrhAWtk3tw/LW/SdV4x/P
	DovjbP8yS3XifPEnVbk+bR/qX/9g1dZ0UzgvNF3J97t9uLLHgf5DOlJKLMUZiYZazEXFiQAa5
	joVkgMAAA==
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-16.tower-385.messagelabs.com!1568119219!4848!1
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11603 invoked from network); 10 Sep 2019 12:40:19 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-16.tower-385.messagelabs.com with ECDHE-RSA-AES256-SHA384
	encrypted SMTP; 10 Sep 2019 12:40:19 -0000
Received: from MTK-SMS-XCH02.digi.com (10.10.8.196) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 10 Sep 2019 07:40:19 -0500
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MTK-SMS-XCH02.digi.com
	(10.10.8.196) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 10 Sep 2019 07:40:18 -0500
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 10 Sep 2019 14:40:16 +0200
To: Armin Kuster <akuster808@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <cover.1560620937.git.akuster808@gmail.com>
	<f2a4c4eab38fd07983bd08f6f3f415d69f831251.1560620937.git.akuster808@gmail.com>
From: Javier Viguera <javier.viguera@digi.com>
Message-ID: <ced08019-3ea9-6108-9aca-a39c7c87ed6b@digi.com>
Date: Tue, 10 Sep 2019 14:40:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f2a4c4eab38fd07983bd08f6f3f415d69f831251.1560620937.git.akuster808@gmail.com>
X-Originating-IP: [10.101.2.54]
Subject: Re: [Warror][ 19/23] leptonica: fix SRC_URI
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
X-List-Received-Date: Tue, 10 Sep 2019 12:54:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Armin,

Care to cherry-pick this fix also to Thud?

Thanks in advance.

--
Javier Viguera

