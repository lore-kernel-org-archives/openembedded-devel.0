Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OLd6A-0002me-Pc for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 16:14:43 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OLd1z-0000gW-MY for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 16:10:23 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jun 2010 16:10:23 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jun 2010 16:10:23 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 07 Jun 2010 16:10:10 +0200
Message-ID: <huiuk3$vrn$1@dough.gmane.org>
References: <1275504373-32623-1-git-send-email-cliff.brake@gmail.com>	<AANLkTilBs6W1OMqbnKf9AujWBBGTWGyHo3Q3C9mr7URg@mail.gmail.com>	<AANLkTin8ybTRctnuKkR9h6lFHZFQDJTLlI7wB2vrc6AA@mail.gmail.com>
	<AANLkTinbCpiUj5C33NE1kx07ZLKRljT92ip6-JD5Ftfn@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100524 Shredder/3.0.6pre
In-Reply-To: <AANLkTinbCpiUj5C33NE1kx07ZLKRljT92ip6-JD5Ftfn@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] packaged-staging.bbclass: fix issue with no SRC_URI
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
X-List-Received-Date: Mon, 07 Jun 2010 14:14:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07-06-10 15:40, Cliff Brake wrote:
> On Fri, Jun 4, 2010 at 3:47 PM, Chris Larson <clarson@kergoth.com> wrote:
>> Please change ${srcuri} to $srcuri, so its very clear that its expanded in
>> shell, rather than letting bitbake try to expand it and fail since its unset
>> :)
>>
>> After that, Acked-by: Chris Larson <chris_larson@mentor.com>
> 
> Thanks!  Updated patch attached.  Can I get one more ack?

Acked-by: Koen Kooi <k-kooi@ti.com>

and don't forget to update patchwork :)


> 
> Thanks,
> Cliff
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMDP3CMkyGM64RGpERAjAiAJsExfnV7BPzUZPW2KHgBTnJKfBbWgCfaFVr
O2VPzEIMBtIolbFEEsothJg=
=aHtc
-----END PGP SIGNATURE-----



