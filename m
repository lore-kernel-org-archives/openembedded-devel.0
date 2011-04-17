Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QBHlX-0001ps-73
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 04:31:11 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QBHjJ-000388-9U from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 19:28:53 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sat, 16 Apr 2011 19:25:50 -0700
Received: from [172.30.80.170] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Sat, 16 Apr 2011 19:28:52 -0700
Message-ID: <4DAA505E.4000305@mentor.com>
Date: Sat, 16 Apr 2011 19:28:46 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <20110414193436.GA26286@denix.org>
In-Reply-To: <20110414193436.GA26286@denix.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 17 Apr 2011 02:25:50.0771 (UTC)
	FILETIME=[C4DBF030:01CBFCA6]
Subject: Re: [2011.03-maintenance] Pull request for TI matrix-gui, ipc and	sgx/gles
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Apr 2011 02:31:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04/14/2011 12:34 PM, Denys Dmytriyenko wrote:
> Tom,
> 
> Please pull these 5 commits for TI related changes - matrix-gui rev bump,
> new ti-ipc version and sgx/gles fixes for ti816x.
> All are cherry picked from oe.dev
> 
> 
> Pull URL: git://arago-project.org/git/people/denix/openembedded.git
>   Branch: 2011.03-maintenance
>   Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance
> 
> Thanks,
>     Denys Dmytriyenko <denys@ti.com>

Applied, thanks.

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNqlBXAAoJEI4NMjfc3nJxzW0H/AsvFhFP6wAkhF1nwqRGpGtt
4Odn6BAF7rCo7ukBNybTGSmViBcx6PKsfkSF9iTj1/cWXL5VOmUAzX8FoTDH9+1i
w/21ZmuvmGuhnjUkF/WA4ub5HcbUBOpVW/0o7XlPfmBsK0OfKfrcKfl5YInJwjE6
O9RIv/3Y7SaYZ6wUR+CbryRH+6rxddUKxw2OiayHC5WIWfNUxZHuheNJFN7Ttb+I
GLkdsw83hndOqCSVt+tQlt4ihdKjflPCtT5UjyK2g/c0671J0SLQkYNwH22CKbQu
Mj7spr9IaRT88TkbfQl1CBxyskJofE9MERs42lbtTRLE2C4LZC9ElQwG+ywFQsU=
=5tDj
-----END PGP SIGNATURE-----


