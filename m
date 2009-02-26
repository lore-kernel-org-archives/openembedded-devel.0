Received: from [209.85.198.244] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1LcY31-0007EG-TH
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Feb 2009 05:40:39 +0100
Received: by rv-out-0708.google.com with SMTP id b17so376835rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2009 20:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=eT9F2mOCoBcmSkR3h9uiz01ApU9My1cjsNvVHP4DKBs=;
	b=N369koJ27o3AE8ErDJmu0MhCap7nc0+1jOh14aPoG1mpZk9u2i9xuffB+XIoKVfjBN
	28yIqLfXADAY7U2bUU6/F6bU0L4xwU7P2S42gphT1zYx7/H8NVdap/VfQR8kiqwNr4TH
	Uqqq3vvOtf9VIFNGd6IPoZ2+PrGA6r9AxRiy4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=VkGsK/60oJNLcgpUSYMZM20H4DB/wG1VEMYlcrvjMqmJCM9JMU89iME6dxkkmZNfeH
	r/RhmQpnhzBqpXN1DlI3WHQOX6pFrw5Ysi+3PJ+d7IyixTrcMy24oRa3ssl6IlyO8uNs
	ri3bpE5laIOyY/BoiukWv0sBM91KRatYGAGe8=
MIME-Version: 1.0
Received: by 10.141.42.10 with SMTP id u10mr410010rvj.61.1235623039738; Wed, 
	25 Feb 2009 20:37:19 -0800 (PST)
Date: Wed, 25 Feb 2009 20:37:19 -0800
Message-ID: <a7f8874a0902252037h6177f2efu1be098779fe87a69@mail.gmail.com>
From: Hans Henry von Tresckow <hvontres@gmail.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
Subject: [OT] Prefered Endianess for ixp4xx Processors
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
X-List-Received-Date: Thu, 26 Feb 2009 04:40:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,
Sorry if this is way off topic, but I was wondering if there are any
advantages running an ixp4xx in either BE or LE mode

-- 
Henry von Tresckow (hvontres)
Fran Lebowitz  - "You're only has good as your last haircut."


