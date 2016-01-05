Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 2943 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Jan 2016 12:21:33 UTC
Received: from mx18-05.smtp.antispamcloud.com (mx18-05.smtp.antispamcloud.com
	[207.244.64.174])
	by mail.openembedded.org (Postfix) with ESMTP id B7079731AE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 12:21:33 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1aGPqi-0000XV-02; Tue, 05 Jan 2016 12:32:30 +0100
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 5 Jan 2016 12:30:30 +0100
To: Jens Rehsack <rehsack@gmail.com>, openembedded-devel
	<openembedded-devel@lists.openembedded.org>
References: <8E273032-FCAF-4476-A017-50D6D2451F14@gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <568BA9C5.5070308@topic.nl>
Date: Tue, 5 Jan 2016 12:32:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <8E273032-FCAF-4476-A017-50D6D2451F14@gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw8CegSk5tpi6IqNQihbr7fN99VfT+gMlVxvQCbHOhegHI2m9VZunOZ2VUdTYG3/HQcLq
	EZliwecTXyBUkBOJODLvozzwD8UyBt/RL5OGGgyK2SPzK9AbJFPYQGGd2JpvmO+1Yzl35GRFcD8h
	oD1TmJ6h2qZDvZMqGrHvt9OLYhf5V8/WIxDEupVsn6fyFLrimhjIEOwIZVBaMhjX7AD+DdM5wTmk
	M9HafFToNFFIa00W17NirEYyqwqMBGrw8ELiqDuwsGtKF8angRTR9uiqGE4i8faU88dU1ZeeRDuK
	WyX/fqb5R4VemuUI6bcEARsm0BwMP+yyyP4XBYTIJakFd0npWSHlBuOe5h511+i8G+61G4rtHofn
	ty3ny7Nxhi/tb8qScuaSWO4wwuxYneZpZbN78uzR9TwUCtitEwkG6Yg2Of354IcncBxB7uicIGwJ
	k4n5y/vcIKE4+MoDT8NV3zf4Qt+dfKmseIPQYs4rYupbFfzn+kZExmIwI1LKDAAyDxYCtn1x/Hwk
	RS8hBFOcoFwK0tfwnjZ/12XlZy3jQSi7kVWClPVvbW5lVyQanRxw5kJFJkw3zL/7VY/UTwytun8Y
	qmh5CVzGULxaKWcg17PgO8mO8LzY9r/U6AUoLJVGfG4rXdbz0LrLaEt0nN2jX/pzQmflAWbkvf70
	miItP3n6
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJUb3OPwsHaH0Fvg5oXltHd/JUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-Spampanel-Domain: topic.nl
X-Spampanel-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.00)
X-Recommended-Action: accept
Subject: Re: [meta-networking][PATCH] samba: move RDEPENDS of perl from samba to samba-pidl
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
X-List-Received-Date: Tue, 05 Jan 2016 12:21:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 04-01-16 20:06, Jens Rehsack wrote:
> samba-pidl is the package containing the perl-extension, so RDEPENDS
> must include perl for samba-pidl, not for samba.
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>   meta-networking/recipes-connectivity/samba/samba_4.1.12.bb | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb b=
/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
> index 5b343f2..de1f033 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
> @@ -39,6 +39,8 @@ SRC_URI[md5sum] =3D "232016d7581a1ba11e991ec2674553c4"
>   SRC_URI[sha256sum] =3D "033604674936bf5c77d7df299b0626052b84a41505a6a6a=
fe902f6274fc29898"
>
>   inherit systemd waf-samba cpan-base perlnative
> +# remove default added RDEPENDS on perl
> +RDEPENDS_${PN}_remove =3D "perl"

This is a hack, not a solution.

Better to fix this at its core: cpan-base.bbclass forces both DEPENDS_${PN}=
=20
and RDEPENDS_${PN} to contain "perl".

All that the recipe really wants to have is the perl version. It does not n=
eed=20
a perl for the target, regardless of whether you'd want to install samba-pi=
dl.

Fixing this at the proper level will considerably reduce compilation time f=
or=20
samba, which is already excessively long because of parallel build issues (=
the=20
patch that fixes that isn't integrated).

>
>   DEPENDS +=3D "readline virtual/libiconv zlib popt libtalloc libtdb libt=
event libldb krb5 ctdb libbsd"
>
> @@ -319,4 +321,5 @@ FILES_${PN}-python-dbg =3D "${libdir}/python${PYTHON_=
BASEVERSION}/site-packages/.d
>                             ${libdir}/python${PYTHON_BASEVERSION}/site-pa=
ckages/samba/dcerpc/.debug/* \
>   "
>
> +RDEPENDS_${PN}-pidl_append =3D " perl "
>   FILES_${PN}-pidl =3D "${bindir}/pidl ${PERL_VERNDORLIB}/*"
> --
> 1.9.1
>
> --
> Jens Rehsack - rehsack@gmail.com
>



Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






