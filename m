Received: from mail-qy0-f195.google.com ([209.85.221.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1OB08t-00039C-Nw
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 May 2010 08:37:36 +0200
Received: by qyk33 with SMTP id 33so4384350qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 May 2010 23:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=60pfh0xup4QLk3s0Ct6ySJFl4GxEFZV11qs61DGUURQ=;
	b=urvPOvfGiJHVhPzdbmb3TS/dhQDZAeNx6WjKn2IPdJPaO5Q/2wLSpj3icdpxkgraGp
	iicvV7uF58X/7gTUac60xcqSdpAJce3xrC9Nv/cS9z/F03jWgou+gei/tXcMQgJGp/Px
	fyYVUil3js8fQ8W2qxpYbXGVilc1cUIX1xFtI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=jlHHY4f1t+lqCepvn2TIdL3Fg96xMMkqdGvNfcktvILSnNyTFvr4oo7l8xS6nVfyqL
	0xomUMrv0Z7ebXsnBiFjQpxMu3lEdmZ4O8stT8/kl0hro4nQiH5JT0iorCGOq/hQVLGQ
	DJU/8JvK2/rxZrI3g5WnuF2uF5BJFv2z1ni8A=
MIME-Version: 1.0
Received: by 10.229.238.70 with SMTP id kr6mr1751453qcb.49.1273386824096; Sat, 
	08 May 2010 23:33:44 -0700 (PDT)
Received: by 10.229.24.149 with HTTP; Sat, 8 May 2010 23:33:43 -0700 (PDT)
Date: Sat, 8 May 2010 23:33:43 -0700
Message-ID: <l2ra7f8874a1005082333od1a41d7h3b019d3614fdd7af@mail.gmail.com>
From: Hans Henry von Tresckow <hvontres@gmail.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.221.195
X-SA-Exim-Mail-From: hvontres@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Anyone using oe with a Hitachi Simplenet Nas dongle?
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
X-List-Received-Date: Sun, 09 May 2010 06:37:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

I just saw that the Hitachi SimpleNet Nas unit (
http://www.simpletech.com/products/storage/simplenet/simplenet.php) is
available for ~$30 around here. Has anyone here worked with one of these or
another Cavium CNS 213x based system?

Thanks,

-- 
Henry von Tresckow (hvontres)

