Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 869 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Dec 2019 09:52:22 UTC
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
	[67.219.250.115])
	by mail.openembedded.org (Postfix) with ESMTP id 31A057C131
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2019 09:52:22 +0000 (UTC)
Received: from [67.219.250.197] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.us-west-2.aws.symcld.net id F9/D9-19882-17E77ED5;
	Wed, 04 Dec 2019 09:37:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRWlGSWpSXmKPExsXi5LtOQLew7nm
	sQcNfaYu9nxYxWlw8vJTZgclj56y77B7nNq5gDGCKYs3MS8qvSGDNWLx3O2vBaZ6KpX+3sDYw
	3uXqYuTiEBJYyShx9sYvJghnEaPEgw+HWLoYOTmEBbwl+n5fYQKxRQRCJe4tbgaLCwnYSLTeu
	8EIYrMJ6ElMvvSEGcTmFbCW+Dj7DpjNIqAi8byphb2LkYNDVCBcYu4OF4gSQYmTM5+AjeEUsJ
	WYPW812BhmAQuJmfPPQ9niEreezGeCsOUlmrfOZoZYqyJxcOllsBoJoPimzWfZJzAKzEIydha
	SUbOQjJqFZNQCRpZVjOZJRZnpGSW5iZk5uoYGBrqGhka6hsamuiYWeolVukl6pcW65anFJbpG
	eonlxXrFlbnJOSl6eaklmxiBgZ5S0G6wg7H161u9Q4ySHExKoryPwp7HCvEl5adUZiQWZ8QXl
	eakFh9ilOHgUJLg/VQDlBMsSk1PrUjLzAFGHUxagoNHSYQ3uBYozVtckJhbnJkOkTrFqMtx/f
	3epcxCLHn5ealS4rwuIEUCIEUZpXlwI2AJ4BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV5
	pkCk8mXklcJteAR3BBHTEgcpnIEeUJCKkpBqYJieV7bzRc0Eo4PkUz3MvZ8Tyqdgv3fjvwmFN
	ye9/rzzuuZeufcvoqlZuGddR1WMzv+svuaS9b/qcV0u7WssNOn5N+GUc9edpZsYBR75U7874X
	WtPHv7za86qOParedULxD4yiPOvODDnb7iI95NTJ8sPvvl473ZuZEBpxPNbFvwvVwT+m7MsPH
	yDuYXIxw32K64GtUzbViGovFJxzav6Qw0rTzz5sHthSOfECVsbKm7WH+5hEml9w2Guy8y425N
	5ltiC8GyehFM+312yZ1ikdfp/5Q1JNg9dyR8TdePnW5NvrsYrJn9/Zbz10dQLfCeeBR1Odlgz
	oVXT4ZOMzV7n/EVempKSnVG71UPMFRa83qfEUpyRaKjFXFScCACLCaG8ewMAAA==
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-18.tower-345.messagelabs.com!1575452272!76806!2
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28304 invoked from network); 4 Dec 2019 09:37:53 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-18.tower-345.messagelabs.com with ECDHE-RSA-AES256-SHA384
	encrypted SMTP; 4 Dec 2019 09:37:53 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 4 Dec 2019 03:37:52 -0600
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 4 Dec 2019 10:37:50 +0100
To: <openembedded-devel@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>
References: <20191127162913.30498-1-arturo.buzarra@digi.com>
From: Javier Viguera <javier.viguera@digi.com>
Message-ID: <421e63c8-2c54-fe73-5917-fe68ffdefa74@digi.com>
Date: Wed, 4 Dec 2019 10:37:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191127162913.30498-1-arturo.buzarra@digi.com>
X-Originating-IP: [10.101.2.54]
Subject: Re: [thud][PATCH] lvm2: Fix RDEPEND on lvm2 to lvm2-udevrules
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
X-List-Received-Date: Wed, 04 Dec 2019 09:52:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Armin,

Could you queue this fix for Thud?

Same fix is already merged in master and Zeus.

-- 
Javier Viguera
Software Engineer

Digi International® Spain S.A.U.



On 27/11/2019 17:29, Arturo Buzarra wrote:
> Commit c6e963f ("lvm2: Add RDEPEND on lvm2 to lvm2-udevrules") added
> a package dependency due to lvm2-udevrules needs dmsetup, however
> dmsetup was moved to libdevmapper in commit 269d009 ("lvm2:
> libdevicemapper package needs udev rules and dmsetup"), so this
> dependency should be only for libdevmapper instead of the full package.
> 
> With the current implementation, a package that has a dependency with
> lvm2-udev rules will include also many unnecessary packages like lvm2,
> lvm2-scripts, etc. and their dependencies.
> 
> Signed-off-by: Arturo Buzarra <arturo.buzarra@digi.com>
> ---
>   meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
> index 7bd7b09d8..08287e358 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
> +++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
> @@ -50,7 +50,7 @@ FILES_${PN}-scripts = " \
>   # Specified explicitly for the udev rules, just in case that it does not get picked
>   # up automatically:
>   FILES_${PN}-udevrules = "${nonarch_base_libdir}/udev/rules.d"
> -RDEPENDS_${PN}-udevrules = "${PN}"
> +RDEPENDS_${PN}-udevrules = "libdevmapper"
>   RDEPENDS_${PN}_append_class-target = " libdevmapper"
>   RDEPENDS_${PN}_append_class-nativesdk = " libdevmapper"
>   
> 



