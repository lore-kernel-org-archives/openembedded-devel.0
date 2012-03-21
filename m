Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SAKVJ-00021b-UF for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 13:19:02 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SAKMi-0007wI-6W for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 13:10:08 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 13:10:08 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 13:10:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 21 Mar 2012 13:10:01 +0100
Message-ID: <jkcgem$agm$1@dough.gmane.org>
References: <1332263919-19283-1-git-send-email-koen@dominion.thruhere.net>
	<1332263919-19283-4-git-send-email-koen@dominion.thruhere.net>
	<CALbNGRRwoJ7MqVFdoCWQC5bmf+HgZD_QV1jUj2Q1nR-jXZWXfg@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
In-Reply-To: <CALbNGRRwoJ7MqVFdoCWQC5bmf+HgZD_QV1jUj2Q1nR-jXZWXfg@mail.gmail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe 4/4] udev: remove 175
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
X-List-Received-Date: Wed, 21 Mar 2012 12:19:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-03-12 08:49, Andreas Müller schreef:
> On Tue, Mar 20, 2012 at 6:18 PM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

> Could we wait with this until libertas works with udev >= 177 [1]?

I'd rather live with the breakage so people are motivated to fix the
libertas driver. Unless someone commits to maintain the 175 recipe, of course.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPacUXAAoJEHZqAkdh1vT6cUoP/jjErwsT8gHBgqWLmR/eIYZF
6PjELnqpmnucA6Vpz6YWXFcc9OFZexHHS0gi4r4onuvBXDYJimo4Uu8u/9NxG/7b
BJwExp84OsBUAopSErcuPR5IghZrP26UhErr3D6A9mfsp7Y0oEpqY2+xK9OQ4ErY
umryoniuAZJCt0qfFj0J1wR/hQyFrPFWZ+0WUT1QtXAys5j9Z5ezw8eO9yfdEH6l
16kzcDkauG+T4nik8ZE6N8fzJjyrUPT+FI5X9qWpY5MmNmp5NuIat1wBUA7ML0wF
MOIHTYpxTSINmlATq1wmIDkXf7butVj0EIPwotvmfWVS65SsWWxTc+sQg9m2POic
p0OW+V8hYu3gY7CT5zdhYTEClaglrRrc5FvA24RqhgvH6RQwbgHBQnimWH1qrT6Q
XLNE1RWdA1ljViRDVwWS1OBxmKXM96oUENWIpB067gta65OKGbLBNy6v++gdtchW
+WEQ9yCOfceVVkpUYCIVTotPgstMsU2dQIx8jLYf04onOgv8+2YuemPnnPJOsrjP
wF1MKEkpYFQFLBTOYF63i2QleJwIbqPmgJzkfpnKo3ZoVbOrjGqUC3bdosPqvmpx
T4EfJi8C4EXE9bOx1XklJ6ghptEBB6PD+BzXL2rpbx75QrLE9Ma2lrYF05JR3Sq3
7AYFa0wg8ivHmAf6ArY0
=w7zk
-----END PGP SIGNATURE-----



