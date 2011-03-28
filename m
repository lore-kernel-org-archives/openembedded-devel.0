Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q41vH-0001qB-2p
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Mar 2011 04:11:16 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q41tJ-0005qs-LM from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Mar 2011 19:09:13 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 27 Mar 2011 19:07:54 -0700
Received: from [172.30.80.76] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Sun, 27 Mar 2011 19:09:12 -0700
Message-ID: <4D8FEDC4.8000001@mentor.com>
Date: Sun, 27 Mar 2011 19:09:08 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <20110326023201.GA13132@denix.org> <4D8F5910.1060803@mentor.com>
	<20110328000202.GA15392@denix.org>
In-Reply-To: <20110328000202.GA15392@denix.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 28 Mar 2011 02:07:54.0084 (UTC)
	FILETIME=[F2D78A40:01CBECEC]
Subject: Re: [2011.03-maintenance] Pull request for external	toolchains updates and matrix-gui
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
X-List-Received-Date: Mon, 28 Mar 2011 02:11:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03/27/2011 05:02 PM, Denys Dmytriyenko wrote:
> On Sun, Mar 27, 2011 at 08:34:40AM -0700, Tom Rini wrote:
>> On 03/25/2011 07:32 PM, Denys Dmytriyenko wrote:
>>> Tom,
>>>
>>> Please pull these 8 commits for the external CSL and Angstrom toolchains, as well
>>> as a trivial SRCREV update for TI's matrix-gui. All are cherry picked from oe.dev
>>>
>>>
>>> Pull URL: git://arago-project.org/git/people/denix/openembedded.git
>>>   Branch: 2011.03-maintenance
>>>   Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance
>>>
>>> Thanks,
>>>     Denys Dmytriyenko <denys@ti.com>
>>
>> $ git pull git://arago-project.org/git/people/denix/openembedded.git
>> 2011.03-maintenance
>> fatal: The remote end hung up unexpectedly
>>
>> Otherwise I'd apply this.  Thanks!
> 
> Can you try again - seems to work here. Thanks. Otherwise I'd have to dig 
> deeper at what's going on...

Works now, applied.

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNj+3DAAoJEI4NMjfc3nJxdQYH/1wvffHoJKzSthbzCWuGs7MH
y8kwHmv6YcTLNF5XIpncmbqQneJJn9ReX3Qge2cfjynus8r5n5DF4Jyc937T4AlK
jtNbNJQ7cNkBPL/VF3DvHeSl7N0r7Dr4wXQKoFynn7Am7m3H2nhkd+V1e155L8+0
R327xXneRNJ3PqtGz+bUX/eCXafVtlSvSPBPdLNokpEqKOmRFxh7ZvTIkpFf8Esx
XLZHc1/MYpspfs2JO8pZZqUECwGL1PmJSq4HV/PRy8XZmMYiTECpH2WI+Hyb28gR
eX24fp+hJTpwub6dbH5TbaVWzdwaXk6iF5hw06mOnLDJKiiuWPtvdkFObd9NuBs=
=eDGb
-----END PGP SIGNATURE-----


